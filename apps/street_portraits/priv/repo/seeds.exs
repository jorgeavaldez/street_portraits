# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StreetPortraits.Repo.insert!(%StreetPortraits.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
StreetPortraits.Repo.insert!(%StreetPortraits.SP.Neighbor{
      address: "183 Castleridge Rd., Red Oak, TX, 75154",
      approx_location: "Oak Lawn",
      name: "Jorge Valdez",
      phone: "972-825-6347",
      preferred_channel: "phone",
})

StreetPortraits.Repo.insert!(%StreetPortraits.SP.Neighbor{
      address: "2660 N Haskell Ave., Dallas, TX, 75204",
      approx_location: "Uptown",
      name: "Amanda Esposito",
      phone: "813-695-7903",
      preferred_channel: "phone",
})

StreetPortraits.Repo.insert!(%StreetPortraits.SP.Neighbor{
      address: "123 Main St., Dallas, TX, 75206",
      approx_location: "Deep Ellum",
      name: "Dave Thomas",
      phone: "911-823-1000",
      preferred_channel: "phone",
})

StreetPortraits.Repo.insert!(%StreetPortraits.SP.Portrait{
      body: "I became homeless when my marriage broke up. I had taken on a big mortgage and the interest rate went up. I became overstretched when my marriage ended. I had lost an income and then I also lost my job.
I was falling further and further behind with my debt repayments. Though I didn’t know it at the time, I think I was having a mental meltdown. I wasn’t able to cope and began drinking too much. I quit my job because I wasn’t happy with the way things were being run at the organisation. 
I imagined I would quickly find another job, but it didn’t work out that way.",
      url: "https://images.unsplash.com/photo-1518398046578-8cca57782e17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      neighbor_id: 1
})

StreetPortraits.Repo.insert!(%StreetPortraits.SP.Portrait{
      body: "I have been homeless twice – once when I was 23 and again at 30. Both times it was due to mental health problems. The first time it happened I left my job because I wasn’t well. I went to stay with my parents, but it didn’t work out and my dad asked me to leave. Then I went to stay with friends. 
I was still struggling and one night I had a panic attack. My friends said: “We love you but you’re starting to drive us mad.” So I left and wandered the streets.",
      url: "https://www.motherjones.com/wp-content/uploads/2017/11/20171117_20140429_sha_t129_141.jpg?w=990",
      neighbor_id: 2
})

StreetPortraits.Repo.insert!(%StreetPortraits.SP.Portrait{
      body: "I made a mistake when I was younger and got caught smoking dope. I ended up having to do a short prison sentence. After that I decided to leave my home town of Derby. I ended up living in a London Fields tower block with a friend. I moved in with him but we fell out after a while and I couldn’t find anywhere else to go. I started squatting and travelling.
When I was in London I started taking drugs. That stopped me sorting myself out and finding a place. It wasn’t a nice time and there were not many jobs around.
I ended up being homeless on the streets on and off. I would sleep rough for a few weeks or a month. I served a few spells in prison but I would usually end up on the streets again as when I got out I had nowhere to live.",
      url: "https://images.unsplash.com/photo-1547524033-e1f60851349b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      neighbor_id: 3
})
