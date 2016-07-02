#![cfg_attr(feature = "clippy", feature(plugin))]
#![cfg_attr(feature = "clippy", plugin(clippy))]
#![cfg_attr(feature = "postgres_macros", feature(plugin))]
#![cfg_attr(feature = "postgres_macros", plugin(postgres_macros))]

extern crate postgres;
extern crate r2d2;
extern crate r2d2_postgres;
pub extern crate rand;
extern crate rustc_serialize;
#[macro_use]
extern crate rustful;

mod prelude;
use prelude::*;

mod handlers;

#[derive(RustcEncodable)]
struct JSONWrapper<T>(T) where T: Encodable;

fn get_connection(ctx: &Context) -> r2d2::PooledConnection<PostgresConnectionManager> {
    // TODO: Error handling
    ctx.global
        .get::<r2d2::Pool<r2d2_postgres::PostgresConnectionManager>>()
        .unwrap()
        .get()
        .unwrap()
}
fn send_response(mut response: Response, data: &str) {
    response.headers_mut().set(AccessControlAllowOrigin::Value("*".into()));
    response.send(data);
}

fn main() {
    let manager = PostgresConnectionManager::new("postgres://postgres@localhost/lanistatsit",
                                                 SslMode::None)
        .unwrap();
    let pool = r2d2::Pool::new(r2d2::Config::default(), manager).unwrap();
    let routes = insert_routes! {
        TreeRouter::new() => {
            "stats" => {
                Get: Box::new(handlers::stats::StatsHandler) as Box<Handler>,
            },
            "heroes" => {
                Get: Box::new(handlers::heroes::HeroesHandler) as Box<Handler>,
            },
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
