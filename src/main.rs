#[macro_use]
extern crate rustful;
extern crate rustc_serialize;
extern crate rand;

use rand::Rng;
use rustc_serialize::json;
use rustc_serialize::Encodable;
use rustful::{Server, Handler, Context, Response, TreeRouter};
use rustful::header::AccessControlAllowOrigin;

#[derive(RustcEncodable)]
struct HeroStat {
    name: String,
    wins: usize,
    losses: usize,
}
#[derive(RustcEncodable)]
struct JSONWrapper<T>(T) where T: Encodable;

impl HeroStat {
    fn new_random(rng: &mut rand::ThreadRng, hero_num: usize) -> HeroStat {
        HeroStat {
            name: format!("Hero {}", hero_num),
            wins: rng.gen_range(0, 100),
            losses: rng.gen_range(0, 100),
        }
    }
}
fn get_hero_stats() -> Vec<HeroStat> {
    let mut rng = rand::thread_rng();
    let num_of_heroes = rng.gen_range(5, 25);
    let mut ret = vec![];
    for hero_num in 1..num_of_heroes {
        ret.push(HeroStat::new_random(&mut rng, hero_num));
    }
    ret
}
struct StatHandler;
impl Handler for StatHandler {
    fn handle_request(&self, _ctx: Context, mut resp: Response) {
        let stats = get_hero_stats();
        let json_formatted = json::encode(&JSONWrapper(stats)).unwrap();
        resp.headers_mut().set(AccessControlAllowOrigin::Value("*".into()));
        resp.send(json_formatted);
    }
}
fn main() {
    let routes = insert_routes! {
        TreeRouter::new() => {
            "stats" => {
                Get: StatHandler,
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
