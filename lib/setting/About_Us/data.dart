class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.description,
    required this.images,
  });
}

List<PlanetInfo> planets = [
  PlanetInfo(1,
      name: 'Mercury',
      iconImage:
          'https://scontent.fpnh1-1.fna.fbcdn.net/v/t1.6435-9/177522938_2891068947832864_6964212350214986227_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeEDBkmnyuhreY91u2DbIQPFqrva8pKO7AGqu9ryko7sAeO3s-k_s_iKSh7cUrIT-Yq6DAZ3L1Di7c4yuupZscfL&_nc_ohc=mBx0UNDkQnsAX-Tzz2u&_nc_ht=scontent.fpnh1-1.fna&oh=00_AT_Ry-Wq9GybZt6SbrBFk92P2CU3-IiK-WGrvWvEhFV0Wg&oe=636B1BE8',
      description:
          "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
      images: [
        'https://scontent.fpnh1-2.fna.fbcdn.net/v/t39.30808-6/308001050_567539541838677_9188607551971318817_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeEaS1tkd3R3LcuKl-fwbqYRreFd_0GfQcSt4V3_QZ9BxDDbKgO4acC0HT7gYmDo0Vtegv2z8xbeOstCeZt8_NwV&_nc_ohc=0TiiEzvcaZwAX9eEixE&tn=BZpKJufqiMGs95MQ&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT9rVQ5grRHy7lezqkV88Ae_xvNNafd1uOPalUolzeutvw&oe=634C0DC3',
        'https://scontent.fpnh1-2.fna.fbcdn.net/v/t39.30808-6/300527716_538353078090657_3742849652754663028_n.jpg?stp=cp6_dst-jpg&_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFf5fgTb8mJnP4fAfabOjJ9mMq_Q_IHhPiYyr9D8geE-OXqskA2HU3z2KkF83wdKy4pUgePfG4mm04CDM_3fXxO&_nc_ohc=gDwCfw4aVWgAX8S6W6m&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT9Gn9Cky-CYYj3g5UFKefAVgAAKJCPkZcOV5-L8PgHsMg&oe=634B98E1',
        'https://scontent.fpnh1-1.fna.fbcdn.net/v/t39.30808-6/301537818_538352921424006_6598677454280640085_n.jpg?stp=cp6_dst-jpg&_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeEqJeCyqNy7p6q9M8noTb2U3-Pgxjugsv7f4-DGO6Cy_q1oiJWgR-TjjwngQI6Ra6IWYd-gNOkvyKLdVYJu4KLr&_nc_ohc=kefpgp_HbnUAX80uqZM&_nc_ht=scontent.fpnh1-1.fna&oh=00_AT9UD4cy5sxPKOIIMeHJvoVwzsL2Bmh4BuZqjfMAPurOwA&oe=634C0F18',
        'https://scontent.fpnh1-2.fna.fbcdn.net/v/t39.30808-6/299338501_535040238421941_2944604465240920609_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGoAopmsL6ME-Sceltip_vQJBn51-gkdBgkGfnX6CR0GGF615SwaKm6Ej4DE1Y1DkRSToYryGVA1ytNRjK2VnSt&_nc_ohc=BnwB1y4PW1gAX-z8Je3&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT8LscdnSyYG7jrqerd1HhX8TYP3cFDGb4msbY6594ZzLQ&oe=634C279E'
      ]),
  PlanetInfo(2,
      name: 'Venus',
      iconImage:
          'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.6435-9/178028699_2890326467907112_6535120839052394172_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHTqGm7OA_En_NI_aVXJkxUtBEZJEFPGNC0ERkkQU8Y0FfGb_FFRMKhJhAG006MJPOV2msUxEyPyXZGXZkGUCN4&_nc_ohc=1EiQ1uvS0XgAX9JwfB-&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT_w92YzizQwWyRqRCiQ5gB4nFhU9nTd7rJDHBkyZUOYVA&oe=636DB177',
      description:
          "The second planet from the sun, Venus is Earth's twin in size. Radar images beneath its atmosphere reveal that its surface has various mountains and volcanoes. But beyond that, the two planets couldn't be more different. Because of its thick, toxic atmosphere that's made of sulfuric acid clouds, Venus is an extreme example of the greenhouse effect. It's scorching-hot, even hotter than Mercury. The average temperature on Venus' surface is 900 F (465 C). At 92 bar, the pressure at the surface would crush and kill you. And oddly, Venus spins slowly from east to west, the opposite direction of most of the other planets.",
      images: [
        'https://scontent.fpnh1-2.fna.fbcdn.net/v/t39.30808-6/305774473_552160013376630_1045510872466883916_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeE5CY_i0rYy2TIY4TlPJ1Ao0BMPKPtee-DQEw8o-1574G3umeqJ-eujdhyT5H1ZJ0xmPvI3RoJF7m-bNdj4nIoX&_nc_ohc=uH20YSRJI1oAX_TWYvw&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT-gzNGyrzlrObSGnO_UTDQ3mzhfc_1ko89wD0A9wIlnOQ&oe=634D506D',
        'https://scontent.fpnh1-2.fna.fbcdn.net/v/t39.30808-6/304943947_552159973376634_6802063973089766541_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeFuv-b4xXEe-gICjcAjvLkF1EN7ViKJ843UQ3tWIonzjfXjqEIPZtIJjjSwbOJq99S0ns_dKbW-5tfnWc1jplBZ&_nc_ohc=rHgANptDJA8AX_OTkD-&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT927u8djXXXWmW_zeplBtOW9IsLF2xgA2fqpkgnABImCA&oe=634B7D45'
      ]),
  PlanetInfo(3,
      name: 'Earth',
      iconImage:
          'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.6435-9/178028699_2890326467907112_6535120839052394172_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHTqGm7OA_En_NI_aVXJkxUtBEZJEFPGNC0ERkkQU8Y0FfGb_FFRMKhJhAG006MJPOV2msUxEyPyXZGXZkGUCN4&_nc_ohc=1EiQ1uvS0XgAX9JwfB-&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT_w92YzizQwWyRqRCiQ5gB4nFhU9nTd7rJDHBkyZUOYVA&oe=636DB177',
      description:
          "The third planet from the sun, Earth is a waterworld, with two-thirds of the planet covered by ocean. It's the only world known to harbor life. Earth's atmosphere is rich in nitrogen and oxygen. Earth's surface rotates about its axis at 1,532 feet per second (467 meters per second) — slightly more than 1,000 mph (1,600 kph) — at the equator. The planet zips around the sun at more than 18 miles per second (29 km per second).",
      images: [
        'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.6435-9/178028699_2890326467907112_6535120839052394172_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHTqGm7OA_En_NI_aVXJkxUtBEZJEFPGNC0ERkkQU8Y0FfGb_FFRMKhJhAG006MJPOV2msUxEyPyXZGXZkGUCN4&_nc_ohc=1EiQ1uvS0XgAX9JwfB-&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT_w92YzizQwWyRqRCiQ5gB4nFhU9nTd7rJDHBkyZUOYVA&oe=636DB177',
        'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.6435-9/178028699_2890326467907112_6535120839052394172_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHTqGm7OA_En_NI_aVXJkxUtBEZJEFPGNC0ERkkQU8Y0FfGb_FFRMKhJhAG006MJPOV2msUxEyPyXZGXZkGUCN4&_nc_ohc=1EiQ1uvS0XgAX9JwfB-&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT_w92YzizQwWyRqRCiQ5gB4nFhU9nTd7rJDHBkyZUOYVA&oe=636DB177',
        'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.6435-9/178028699_2890326467907112_6535120839052394172_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHTqGm7OA_En_NI_aVXJkxUtBEZJEFPGNC0ERkkQU8Y0FfGb_FFRMKhJhAG006MJPOV2msUxEyPyXZGXZkGUCN4&_nc_ohc=1EiQ1uvS0XgAX9JwfB-&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT_w92YzizQwWyRqRCiQ5gB4nFhU9nTd7rJDHBkyZUOYVA&oe=636DB177',
        'https://image.shutterstock.com/image-photo/3d-render-planet-earth-viewed-600w-1069251782.jpg'
      ]),
  PlanetInfo(4,
      name: 'Mars',
      iconImage:
          'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.6435-9/118093565_2697826150490479_1989254656518010130_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFHRi1adie9nyyNmtTd98K1Upvb1CxasTRSm9vULFqxNEgnDRKzY4iiTkdLCDc0Qtq6W2J08agFbZOMsSGXYRVM&_nc_ohc=qkVPf_wj-LcAX9aBsE_&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT-41HyDBZAArny4N29rO_-TtKFAa0sO1vj8gcvtGNTWaA&oe=636E1CAC',
      description:
          "The fourth planet from the sun is Mars, and it's a cold, desert-like place covered in dust. This dust is made of iron oxides, giving the planet its iconic red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. ",
      images: []),
  PlanetInfo(5,
      name: 'Jupiter',
      iconImage:
          'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.6435-9/109694105_2662209557385472_3708771455348985379_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFhrWHYO7GYqnOUOIvSo1mbS-EScMxu7iNL4RJwzG7uI_EXISEAizW4JV__b52DmFqUBGCzb7QxuufVbtT3w8I-&_nc_ohc=Vm8eKMClAH0AX-WKc6V&_nc_ht=scontent.fpnh1-2.fna&oh=00_AT8KGYr7rKv1xwHw41jf-186zoW_3STOMSj5mFxJAMdZPA&oe=636C223B',
      description:
          "The fifth planet from the sun, Jupiter is a giant gas world that is the most massive planet in our solar system — more than twice as massive as all the other planets combined, according to NASA. Its swirling clouds are colorful due to different types of trace gases. And a major feature in its swirling clouds is the Great Red Spot, a giant storm more than 10,000 miles wide. It has raged at more than 400 mph for the last 150 years, at least. Jupiter has a strong magnetic field, and with 75 moons, it looks a bit like a miniature solar system.",
      images: []),
  PlanetInfo(6,
      name: 'Saturn',
      iconImage:
          'https://scontent.fpnh1-1.fna.fbcdn.net/v/t1.6435-9/86935798_2537831689823260_3937349382424231936_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGadRPxM4a2M5cuZjG0pgVYPAvYGBIwCKE8C9gYEjAIobuU6gE80qVOvlX0s0qpI0qvqEI6b-btKjVGQ25VDQXw&_nc_ohc=wxIAWYblfGoAX_JHPH1&_nc_ht=scontent.fpnh1-1.fna&oh=00_AT81wiVz21pDv9TT8o4RJJoIZ2Q4ZV2WZpRz5VP4t3qD3Q&oe=636D9896',
      description:
          "The sixth planet from the sun, Saturn is known most for its rings. When polymath Galileo Galilei first studied Saturn in the early 1600s, he thought it was an object with three parts: a planet and two large moons on either side. Not knowing he was seeing a planet with rings, the stumped astronomer entered a small drawing — a symbol with one large circle and two smaller ones — in his notebook, as a noun in a sentence describing his discovery. More than 40 years later, Christiaan Huygens proposed that they were rings. The rings are made of ice and rock and scientists are not yet sure how they formed. The gaseous planet is mostly hydrogen and helium and has numerous moons.",
      images: []),
  PlanetInfo(7,
      name: 'Uranus',
      iconImage:
          'https://scontent.fpnh1-1.fna.fbcdn.net/v/t31.18172-8/25182094_1984815115124923_3919811001927423820_o.jpg?_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGAn80zFBqAGDMVor5kYX-4sv9jd1NuISiy_2N3U24hKGEOTFbtfrAmHnZWRyfbBcJwEkWJcQtwqPGrBbuE5klB&_nc_ohc=070wYEXRwWYAX9Iq2zT&_nc_ht=scontent.fpnh1-1.fna&oh=00_AT9dhTKHBh1MDQMtS-p6a2vrS51CCVHw5IQajQGZdIgrBQ&oe=636E7E0C',
      description:
          "The seventh planet from the sun, Uranus is an oddball. It has clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. It rotates from east to west like Venus. But unlike Venus or any other planet, its equator is nearly at right angles to its orbit — it basically orbits on its side. Astronomers believe an object twice the size of Earth collided with Uranus roughly 4 billion years ago, causing Uranus to tilt. That tilt causes extreme seasons that last 20-plus years, and the sun beats down on one pole or the other for 84 Earth-years at a time. ",
      images: []),
  PlanetInfo(8,
      name: 'Neptune',
      iconImage:
          'https://scontent.fpnh1-1.fna.fbcdn.net/v/t39.30808-6/310081408_573743434551621_3496388385637041985_n.jpg?stp=cp6_dst-jpg&_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGPVMG21L_Md_NIb6XdZT7wQ61zJ4u2qFNDrXMni7aoU7xPTtHRd4bZDK1qM-N8Jr2p6BpWVooxkDrNoc0WlQ3V&_nc_ohc=IiYnWOZ6zawAX-RFVRS&_nc_ht=scontent.fpnh1-1.fna&oh=00_AT-9Z_vtFJyYU3q5Qy8lYG5phw8dC6_zU9jp6Hht9LAb7Q&oe=634C3B76',
      description:
          "The eighth planet from the sun, Neptune is about the size of Uranus and is known for supersonic strong winds. Neptune is far out and cold. The planet is more than 30 times as far from the sun as Earth. Neptune was the first planet predicted to exist by using math, before it was visually detected. Irregularities in the orbit of Uranus led French astronomer Alexis Bouvard to suggest some other planet might be exerting a gravitational tug. German astronomer Johann Galle used calculations to help find Neptune in a telescope. Neptune is about 17 times as massive as Earth and has a rocky core.",
      images: []),
];
