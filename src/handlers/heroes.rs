use ::prelude::*;

#[derive(RustcEncodable)]
pub struct Hero {
    pub name: String,
    pub image_name: String,
}

pub struct HeroesHandler;
impl Handler for HeroesHandler {
    fn handle_request(&self, ctx: Context, resp: Response) {
        let conn = ::get_connection(&ctx);
        let query = sql!("select * from heroes");
        let heroes = conn.query(query, &[])
            .unwrap()
            .iter()
            .map(|row| {
                Hero {
                    name: row.get(1),
                    image_name: row.get(2),
                }
            })
            .collect::<Vec<_>>();
        let json_formatted = json::encode(&::JSONWrapper(heroes)).unwrap();
        ::send_response(resp, &json_formatted);
    }
}
