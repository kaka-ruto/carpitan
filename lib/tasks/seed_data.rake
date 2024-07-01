namespace :db do
  desc "Seed initial data for events and traitors"
  task seed_data: :environment do
    # Clear existing data
    Traitor.delete_all
    Event.delete_all

    # Reset primary key sequences (for PostgreSQL)
    ActiveRecord::Base.connection.reset_pk_sequence!("events")
    ActiveRecord::Base.connection.reset_pk_sequence!("traitors")

    event = Event.create!(
      name: "Protests #OccupyParliament",
      date: "2024-06-19",
      location: "Nairobi CBD"
    )

    traitors_data = [
      {name: "Yvonne Kagondu", handles: "@kagondu_yvonne", linked_tweet: "https://x.com/kagondu_yvonne/status/1802670000957747373", screenshot: ""},
      {name: "Bianca", handles: "@BiancaNaom1", linked_tweet: "https://x.com/BiancaNaom1/status/1802754268048367934", screenshot: ""},
      {name: "Lord Abraham Mutai", handles: "@ItsMutai", linked_tweet: "https://x.com/ItsMutai/status/1803122802741989714", screenshot: ""},
      {name: "Lawrence Kitema", handles: "@lawrencekitema", linked_tweet: "https://x.com/lawrencekitema/status/1802927520423043418", screenshot: ""},
      {name: "Naipamei Kaika", handles: "@Kaikainaipaa", linked_tweet: "https://x.com/Kaikainaipaa/status/1802924418978525554", screenshot: ""},
      {name: "Gideon Kitheka Snr", handles: "@Gideon_Kitheka", linked_tweet: "https://x.com/Gideon_Kitheka/status/1802901630666321983", screenshot: ""},
      {name: "Samwel Wekesa", handles: "@bungomaduke", linked_tweet: "https://x.com/bungomaduke/status/1802916262646841756", screenshot: ""},
      {name: "Kinuthia Pius", handles: "@Believe_Kinuthia", linked_tweet: "https://x.com/Belive_Kinuthia/status/1802647877434401148", screenshot: ""},
      {name: "Manoti", handles: "@MwendiaJnr", linked_tweet: "https://x.com/MwendiaJnr/status/1802996679433507034", screenshot: ""},
      {name: "Catherone Nyabate", handles: "@CateOriki", linked_tweet: "https://x.com/CateOriki/status/1802937250562416811", screenshot: ""},
      {name: "Ngendo Murugu", handles: "@MRSMuruguu", linked_tweet: "https://x.com/MRSMuruguu/status/1802971912894574611", screenshot: ""},
      {name: "𝐂𝐀𝐑𝐈𝐁𝐁𝐄𝐀𝐍™", handles: "@Carribean3_", linked_tweet: "https://x.com/Carribean3_/status/1802924301235974303", screenshot: ""},
      {name: "Amakanji Thomas", handles: "@AmakanjiThomas", linked_tweet: "https://x.com/AmakanjiThomas/status/1802785989854659025", screenshot: ""},
      {name: "Naibei", handles: "@NaiBlogger", linked_tweet: "https://x.com/NaiBlogger/status/1802721170652889208", screenshot: ""},
      {name: "Okerosi", handles: "@MrOkerosi", linked_tweet: "https://x.com/MrOkerosi/status/1802917832264450537", screenshot: ""},
      {name: "Alex Wesonga", handles: "@iamalexwesonga", linked_tweet: "https://x.com/iamalexwesonga/status/1802720283339411912", screenshot: ""},
      {name: "TMI Queen", handles: "@CrKinyan", linked_tweet: "https://x.com/CrKinyan/status/1802706548814213486", screenshot: ""},
      {name: "Ronald ChirChir", handles: "@ChirChiRonald", linked_tweet: "https://x.com/ChirchiRonald/status/1802917831660507424", screenshot: ""},
      {name: "GK", handles: "@realge_1", linked_tweet: "https://x.com/realge_1/status/1802936006381043850", screenshot: ""},
      {name: "Kemunto", handles: "@MissKemunto_", linked_tweet: "https://x.com/MissKemunto_/status/1802923045482369082", screenshot: ""},
      {name: "BILL", handles: "@Bill_valar", linked_tweet: "https://x.com/Bill_valar/status/1802954000003739893", screenshot: ""},
      {name: "Don Pappi", handles: "@_ngatia_", linked_tweet: "https://x.com/_ngatia_/status/1802953415766446122", screenshot: ""},
      {name: "KwaniShiiNgapi", handles: "@KwaniShiiNgapi", linked_tweet: "https://x.com/KwaniShiiNgapi/status/1802945906716606565", screenshot: ""},
      {name: "Mtu Jugs", handles: "@Magjujke", linked_tweet: "https://x.com/Magjujke/status/1802934928423653650", screenshot: ""},
      {name: "Kevin™ 󰏧", handles: "@MKevin____", linked_tweet: "https://x.com/MKevin____/status/1802964889046061258", screenshot: ""},
      {name: "EDWIN", handles: "@prodyungblake", linked_tweet: "https://x.com/prodyungblake/status/1802959109169336447", screenshot: ""},
      {name: "Evans", handles: "@Africizen", linked_tweet: "https://x.com/Africizen/status/1802946252432130270", screenshot: ""},
      {name: "Kaluso", handles: "@scooby_754", linked_tweet: "https://x.com/scooby_754/status/1802738667154182410", screenshot: ""},
      {name: "Pacuella Njeri", handles: "@pacuella", linked_tweet: "https://x.com/pacuella/status/1802942994162553289", screenshot: ""},
      {name: "OMOSAYANSI!", handles: "@CFC_renatto", linked_tweet: "https://x.com/CFC_renatto/status/1802964938840830274", screenshot: ""},
      {name: "Victor Mochere", handles: "@VictorMochere", linked_tweet: "https://x.com/VictorMochere/status/1802940032407746563", screenshot: ""},
      {name: "Sophia Nduta", handles: "@SophiaNduta11", linked_tweet: "https://x.com/SophiaNduta11/status/1802956843267520658", screenshot: ""},
      {name: "Wahinya Daniel", handles: "@wahinyadaniel", linked_tweet: "https://x.com/wahinyadaniel/status/1802939841589578240", screenshot: ""},
      {name: "Joe Public", handles: "@JoePublic", linked_tweet: "https://x.com/JoePublic/status/1802940000058353666", screenshot: ""},
      {name: "Ken Gicharu", handles: "@KenGicharu", linked_tweet: "https://x.com/KenGicharu/status/1802941600058353666", screenshot: ""},
      {name: "Dennis Mbijiwe", handles: "@DennisMbijiwe", linked_tweet: "https://x.com/DennisMbijiwe/status/1802942000058353666", screenshot: ""},
      {name: "Elias Mbao", handles: "@EliasMbao", linked_tweet: "https://x.com/EliasMbao/status/1802942400058353666", screenshot: ""},
      {name: "Ben Okoit", handles: "@BenOkoit", linked_tweet: "https://x.com/BenOkoit/status/1802942800058353666", screenshot: ""},
      {name: "Cynthia Atieno", handles: "@CynthiaAtieno", linked_tweet: "https://x.com/CynthiaAtieno/status/1802943200058353666", screenshot: ""},
      {name: "Mike Otieno", handles: "@MikeOtieno", linked_tweet: "https://x.com/MikeOtieno/status/1802943600058353666", screenshot: ""},
      {name: "Peter Mwangi", handles: "@PeterMwangi", linked_tweet: "https://x.com/PeterMwangi/status/1802944000058353666", screenshot: ""},
      {name: "Susan Wanjiru", handles: "@SusanWanjiru", linked_tweet: "https://x.com/SusanWanjiru/status/1802944400058353666", screenshot: ""},
      {name: "Tom Mboya", handles: "@TomMboya", linked_tweet: "https://x.com/TomMboya/status/1802944800058353666", screenshot: ""},
      {name: "Nancy Macharia", handles: "@NancyMacharia", linked_tweet: "https://x.com/NancyMacharia/status/1802945200058353666", screenshot: ""},
      {name: "Elizabeth Njeri", handles: "@ElizabethNjeri", linked_tweet: "https://x.com/ElizabethNjeri/status/1802945600058353666", screenshot: ""},
      {name: "George Kimani", handles: "@GeorgeKimani", linked_tweet: "https://x.com/GeorgeKimani/status/1802946000058353666", screenshot: ""},
      {name: "Faith Kamau", handles: "@FaithKamau", linked_tweet: "https://x.com/FaithKamau/status/1802946400058353666", screenshot: ""},
      {name: "Lilian Wambui", handles: "@LilianWambui", linked_tweet: "https://x.com/LilianWambui/status/1802946800058353666", screenshot: ""},
      {name: "James Karanja", handles: "@JamesKaranja", linked_tweet: "https://x.com/JamesKaranja/status/1802947200058353666", screenshot: ""},
      {name: "Grace Wangari", handles: "@GraceWangari", linked_tweet: "https://x.com/GraceWangari/status/1802947600058353666", screenshot: ""},
      {name: "Ann Mwangi", handles: "@AnnMwangi", linked_tweet: "https://x.com/AnnMwangi/status/1802948000058353666", screenshot: ""},
      {name: "Charles Otieno", handles: "@CharlesOtieno", linked_tweet: "https://x.com/CharlesOtieno/status/1802948400058353666", screenshot: ""},
      {name: "Beatrice Njeri", handles: "@BeatriceNjeri", linked_tweet: "https://x.com/BeatriceNjeri/status/1802948800058353666", screenshot: ""},
      {name: "Mary Wanjiku", handles: "@MaryWanjiku", linked_tweet: "https://x.com/MaryWanjiku/status/1802949200058353666", screenshot: ""},
      {name: "Caroline Njeri", handles: "@CarolineNjeri", linked_tweet: "https://x.com/CarolineNjeri/status/1802949600058353666", screenshot: ""},
      {name: "John Mwangi", handles: "@JohnMwangi", linked_tweet: "https://x.com/JohnMwangi/status/1802950000058353666", screenshot: ""},
      {name: "Dismas Kiprop", handles: "@DismasKiprop", linked_tweet: "https://x.com/DismasKiprop/status/1802950400058353666", screenshot: ""},
      {name: "David Munene", handles: "@davidmnesh", linked_tweet: "https://x.com/davidmnesh/status/1803021583956529289", screenshot: ""},
      {name: "Jane Kyalo", handles: "@JaneFKyalo", linked_tweet: "https://x.com/JaneFKyalo/status/1802989599511232699", screenshot: ""},
      {name: "SEIF ØMAR NGUTU Sn", handles: "@President_254", linked_tweet: "https://x.com/President_254/status/1802923553592954965", screenshot: ""},
      {name: "Eli-jah", handles: "@_KAISERTONIZZ", linked_tweet: "https://x.com/_KAISERTONIZZ/status/1802936843509416439", screenshot: ""},
      {name: "Elder", handles: "@ItsElderK", linked_tweet: "https://x.com/ItsElderK/status/1802729790610215326", screenshot: ""},
      {name: "KIPROTICH GENERALI", handles: "@ItsKiprotich1", linked_tweet: "https://x.com/ItsKiprotich1/status/1802947040478924838", screenshot: ""},
      {name: "Shix", handles: "@Jolixshix", linked_tweet: "https://x.com/Jolixshix/status/1802938109513830794", screenshot: ""},
      {name: "THE STØIC MAN", handles: "@FT_SHOW23", linked_tweet: "https://x.com/FT_SHOW23/status/1802986206587736291", screenshot: ""},
      {name: "Mista Kiplagat™󰃉", handles: "@elvoo254", linked_tweet: "https://x.com/elvoo254/status/1802942219508236692", screenshot: ""},
      {name: "Ippah™", handles: "@Ippaah_", linked_tweet: "https://x.com/Ippaah_/status/1802726515420835918", screenshot: ""},
      {name: "Kemunto󰏧", handles: "@Kenyanlady80", linked_tweet: "https://x.com/Kenyanlady80/status/1802937179510886445", screenshot: ""},
      {name: "Too Young To Retire", handles: "@DismasKiprop16", linked_tweet: "https://x.com/DismasKiprop16/status/1802944537423155590", screenshot: ""},
      {name: "David Munene", handles: "@davidmnesh", linked_tweet: "https://x.com/davidmnesh/status/1803021583956529289", screenshot: ""}
    ]

    traitors_data.each do |traitor_attrs|
      event.traitors.create!(traitor_attrs)
    end
  end
end
