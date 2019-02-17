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
      body: "Here's some body",
      url: "https://images.unsplash.com/photo-1518398046578-8cca57782e17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      neighbor: 1
})

StreetPortraits.Repo.insert!(%StreetPortraits.SP.Portrait{
      body: "Here's another body",
      url: "https://www.motherjones.com/wp-content/uploads/2017/11/20171117_20140429_sha_t129_141.jpg?w=990",
      neighbor: 2
})

StreetPortraits.Repo.insert!(%StreetPortraits.SP.Portrait{
      body: "Here's the last body",
      url: "https://images.unsplash.com/photo-1547524033-e1f60851349b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      neighbor: 3
})
