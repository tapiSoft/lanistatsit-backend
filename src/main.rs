#[macro_use]
extern crate rustful;
use rustful::{Server, Handler, Context, Response, TreeRouter};
use std::sync::{Arc, Mutex};

struct DumbHandler {
    value: Arc<Mutex<usize>>,
}
impl DumbHandler {
    fn new() -> DumbHandler {
        DumbHandler { value: Arc::new(Mutex::new(1)) }
    }
}
impl Handler for DumbHandler {
    fn handle_request(&self, _ctx: Context, resp: Response) {
        let val = {
            let mut value_container = self.value.lock().unwrap();
            let val = *value_container;
            *value_container = val + 1;
            val
        };
        let json_formatted = format!(r#"{{"value": {}}}"#, val);
        resp.send(json_formatted);
    }
}
fn main() {
    let routes = insert_routes! {
        TreeRouter::new() => {
            "test" => {
                Get: DumbHandler::new(),
            }
        }
    };
    let server = Server {
        handlers: routes,
        host: 8080.into(),
        content_type: "application/json".parse().unwrap(),
        ..Server::default()
    };
    server.run().unwrap();
}
