use ::prelude::*;

#[derive(RustcEncodable)]
struct HeroStats {
    name: String,
    wins: usize,
    losses: usize,
}
impl HeroStats {
    fn new_random(rng: &mut rand::ThreadRng, hero_num: usize) -> HeroStats {
        HeroStats {
            name: format!("Hero {}", hero_num),
            wins: rng.gen_range(0, 100),
            losses: rng.gen_range(0, 100),
        }
    }
    fn gen_random() -> Vec<HeroStats> {
        let mut rng = rand::thread_rng();
        let num_of_heroes = rng.gen_range(5, 25);
        let mut ret = vec![];
        for hero_num in 1..num_of_heroes {
            ret.push(HeroStats::new_random(&mut rng, hero_num));
        }
        ret
    }
}

pub struct StatsHandler;
impl Handler for StatsHandler {
    fn handle_request(&self, _ctx: Context, resp: Response) {
        let stats = HeroStats::gen_random();
        let json_formatted = json::encode(&::JSONWrapper(stats)).unwrap();
        ::send_response(resp, &json_formatted);
    }
}
