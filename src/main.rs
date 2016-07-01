#![cfg_attr(feature = "clippy", feature(plugin))]
#![cfg_attr(feature = "clippy", plugin(clippy))]
#![cfg_attr(feature = "postgres_macros", feature(plugin))]
#![cfg_attr(feature = "postgres_macros", plugin(postgres_macros))]

extern crate postgres;
extern crate r2d2;
extern crate r2d2_postgres;
extern crate rand;
extern crate rustc_serialize;
#[macro_use]
extern crate rustful;

use r2d2_postgres::{SslMode, PostgresConnectionManager};
use rand::Rng;
use rustc_serialize::Encodable;
use rustc_serialize::json;
use rustful::header::AccessControlAllowOrigin;
use rustful::{Server, Handler, Context, Response, TreeRouter};

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
fn get_connection(ctx: &Context) -> r2d2::PooledConnection<PostgresConnectionManager> {
    // TODO: Error handling
    ctx.global
        .get::<r2d2::Pool<r2d2_postgres::PostgresConnectionManager>>()
        .unwrap()
        .get()
        .unwrap()
}
struct StatHandler;
impl Handler for StatHandler {
    fn handle_request(&self, ctx: Context, mut resp: Response) {
        let stats = get_hero_stats();
        let conn = get_connection(&ctx);
        let query = sql!("select * from heroes");
        let results = conn.query(query, &[]);
        println!("{:?}", results);
        let json_formatted = json::encode(&JSONWrapper(stats)).unwrap();
        resp.headers_mut().set(AccessControlAllowOrigin::Value("*".into()));
        resp.send(json_formatted);
    }
}
fn main() {
    let manager = PostgresConnectionManager::new("postgres://postgres@localhost/lanistatsit",
                                                 SslMode::None)
        .unwrap();
    let pool = r2d2::Pool::new(r2d2::Config::default(), manager).unwrap();
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
        global: Box::new(pool).into(),
        content_type: "application/json".parse().unwrap(),
        ..Server::default()
    };
    server.run().unwrap();
}
