# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Helper method to generate random name
def random_name
  first_names = [
    "John", "Jane", "Emily", "Michael", "Sarah",
    "William", "Elizabeth", "Henry", "Nancy", "George",
    "Alice", "Brian", "Catherine", "David", "Ella",
    "Frank", "Grace", "Harry", "Ivy", "Jack",
    "Karen", "Leo", "Molly", "Nathan", "Olivia",
    "Paul", "Quinn", "Rachel", "Steve", "Tina",
    "Ulysses", "Victoria", "Walter", "Xena", "Yvonne",
    "Zach", "Allison", "Bobby", "Chloe", "Derek",
    "Eva", "Finn", "Gloria", "Hank", "Irene",
    "Jerry", "Katie", "Louis", "Mandy", "Neil",
    "Aaron", "Abigail", "Adam", "Addison", "Adrian",
    "Aiden", "Alan", "Albert", "Alex", "Alexandra",
    "Alexis", "Alice", "Alicia", "Allan", "Allen",
    "Alyssa", "Amanda", "Amber", "Amelia", "Amy",
    "Andrea", "Andrew", "Angela", "Angelica", "Angelina",
    "Anna", "Anne", "Annie", "Anthony", "Antonio",
    "April", "Archie", "Ariana", "Arthur", "Ashley",
    "Audrey", "Austin", "Ava", "Barbara", "Barry",
    "Beatrice", "Becky", "Belinda", "Ben", "Benjamin",
    "Bernard", "Beth", "Bethany", "Betty", "Beverly",
    "Bill", "Billy", "Blake", "Bonnie", "Brad",
    "Bradley", "Brandon", "Brandy", "Brenda", "Brett",
    "Brian", "Bridget", "Brittany", "Bruce", "Bryan",
    "Caleb", "Calvin", "Cameron", "Camille", "Candace",
    "Carl", "Carla", "Carlos", "Carmen", "Carol",
    "Caroline", "Carolyn", "Casey", "Cassandra", "Catherine",
    "Cathy", "Cecilia", "Chad", "Charlene", "Charles",
    "Charlie", "Charlotte", "Cheryl", "Chris", "Christina",
    "Christine", "Christopher", "Chuck", "Claire", "Clara",
    "Clarence", "Claudia", "Clayton", "Clifford", "Clint",
    "Cody", "Colin", "Colleen", "Connie", "Connor",
    "Constance", "Corey", "Courtney", "Craig", "Crystal",
    "Cynthia", "Dale", "Dana", "Daniel", "Danielle",
    "Darin", "Dawn", "Dean", "Deanna", "Debbie",
    "Deborah", "Debra", "Denise", "Dennis", "Derek",
    "Derrick", "Diana", "Diane", "Dolores", "Dominic",
    "Don", "Donald", "Donna", "Dora", "Doris",
    "Dorothy", "Doug", "Douglas", "Drew", "Duane",
    "Dustin", "Dwayne", "Dylan", "Earl", "Ed",
    "Eddie", "Edgar", "Edith", "Edmund", "Edward",
    "Edwin", "Eileen", "Elaine", "Eleanor", "Elena",
    "Eli", "Elijah", "Elise", "Elizabeth", "Ella",
    "Ellen", "Elmer", "Elsa", "Emily", "Emma",
    "Eric", "Erica", "Erik", "Erin", "Ernest",
    "Esther", "Ethan", "Eugene", "Eva", "Evan",
    "Evelyn", "Everett", "Faith", "Faye", "Felix",
    "Fernando", "Fiona", "Floyd", "Frances", "Francis",
    "Frank", "Franklin", "Fred", "Freddie", "Frederick",
    "Gabriel", "Gail", "Gary", "Gavin", "Gene",
    "George", "Georgia", "Gerald", "Geraldine", "Gertrude",
    "Gilbert", "Gina", "Ginger", "Glen", "Glenda",
    "Glenn", "Gloria", "Gordon", "Grace", "Grant",
    "Greg", "Gregory", "Gretchen", "Guy", "Gwen",
    "Gwendolyn", "Haley", "Hannah", "Harold", "Harry",
    "Harvey", "Hazel", "Heather", "Heidi", "Helen",
    "Henry", "Herbert", "Holly", "Hope", "Howard",
    "Hugh", "Hunter", "Ian", "Ida", "Irene",
    "Iris", "Isaac", "Isabel", "Isabella", "Isabelle",
    "Isaiah", "Ivan", "Ivy", "Jack", "Jackie",
    "Jackson", "Jacob", "Jacqueline", "Jade", "Jake",
    "James", "Jamie", "Jan", "Jane", "Janet",
    "Janice", "Jared", "Jasmine", "Jason", "Jay",
    "Jean", "Jeanette", "Jeff", "Jeffery", "Jeffrey",
    "Jenna", "Jennifer", "Jenny", "Jeremiah", "Jeremy",
    "Jerry", "Jesse", "Jessica", "Jessie", "Jill",
    "Jim", "Jimmy", "Joan", "Joann", "Joanna",
    "Joanne", "Jodi", "Jodie", "Joe", "Joel",
    "John", "Johnny", "Jon", "Jonathan", "Jordan",
    "Jose", "Joseph", "Josephine", "Josh", "Joshua",
    "Joy", "Joyce", "Juan", "Juanita", "Judith",
    "Judy", "Julia", "Julian", "Julie", "Justin",
    "Kara", "Karen", "Karl", "Kate", "Katherine",
    "Kathleen", "Kathryn", "Kathy", "Katie", "Katrina",
    "Kay", "Keith", "Kelly", "Ken", "Kendra",
    "Kenneth", "Kenny", "Kent", "Kevin", "Kim",
    "Kimberly", "Kirk", "Kirsten", "Krista", "Kristen",
    "Kristi", "Kristin", "Kristina", "Kristine", "Kurt",
    "Kyle", "Lance", "Larry", "Laura", "Lauren",
    "Laurie", "Lawrence", "Leah", "Lee", "Leigh",
    "Lena", "Leo", "Leon", "Leona", "Leonard",
    "Leslie", "Lester", "Leticia", "Lewis", "Lila",
    "Lillian", "Linda", "Lindsay", "Lindsey", "Lisa",
    "Lloyd", "Logan", "Lois", "Loretta", "Lori",
    "Lorraine", "Louis", "Louise", "Lucas", "Lucille",
    "Lucy", "Luis", "Luke", "Luther", "Lydia",
    "Lynn", "Lynne", "Mabel", "Mack", "Madeline",
    "Madison", "Mae", "Maggie", "Malcolm", "Mallory",
    "Mandy", "Manuel", "Marc", "Marcia", "Margaret",
    "Margarita", "Maria", "Marian", "Marianne", "Marie",
    "Marilyn", "Mario", "Marion", "Marjorie", "Mark",
    "Marlene", "Marsha", "Marshall", "Martha", "Martin",
    "Marty", "Marvin", "Mary", "Maryann", "Mason",
    "Matt", "Matthew", "Maureen", "Maurice", "Max",
    "Maxine", "May", "Megan", "Meghan", "Melanie",
    "Melinda", "Melissa", "Melody", "Melvin", "Meredith",
    "Merle", "Michael", "Michele", "Michelle", "Mickey",
    "Miguel", "Mike", "Mildred", "Miles", "Millie",
    "Milton", "Mindy", "Miranda", "Miriam", "Mitchell",
    "Molly", "Monica", "Morris", "Muriel", "Myra",
    "Myrtle", "Nancy", "Naomi", "Natalie", "Nathan",
    "Nathaniel", "Neal", "Ned", "Neil", "Nell",
    "Nellie", "Nelson", "Neva", "Nicholas", "Nick",
    "Nicole", "Nina", "Noah", "Nora", "Norma",
    "Norman", "Olga", "Olive", "Oliver", "Olivia",
    "Ollie", "Opal", "Oscar", "Otis", "Owen",
    "Pam", "Pamela", "Pat", "Patricia", "Patrick",
    "Patsy", "Patti", "Paul", "Paula", "Pauline",
    "Peggy", "Penny", "Perry", "Pete", "Peter",
    "Phil", "Philip", "Phillip", "Phyllis", "Polly",
    "Priscilla", "Quincy", "Quinn", "Rachel", "Ralph",
    "Randall", "Randolph", "Randy", "Raquel", "Ray",
    "Raymond", "Rebecca", "Regina", "Reginald", "Renee",
    "Rhonda", "Ricardo", "Richard", "Rick", "Ricky",
    "Rita", "Rob", "Robbie", "Robert", "Roberta",
    "Robin", "Rochelle", "Rocky", "Rod", "Rodney",
    "Roger", "Roland", "Ron", "Ronald", "Ronda",
    "Ronnie", "Roosevelt", "Rosa", "Rosalie", "Rosalind",
    "Rosanne", "Rose", "Rosemary", "Rosie", "Ross",
    "Roxanne", "Roy", "Ruby", "Rudolph", "Rudy",
    "Russell", "Ruth", "Ryan", "Sabrina", "Sadie",
    "Sally", "Salvatore", "Sam", "Samantha", "Samuel",
    "Sandra", "Sandy", "Sara", "Sarah", "Saul",
    "Scott", "Sean", "Sebastian", "Selma", "Seth",
    "Shane", "Shannon", "Shari", "Sharon", "Shaun",
    "Shawn", "Sheila", "Shelby", "Sheldon", "Shelia",
    "Shelley", "Shelly", "Sheri", "Sherman", "Sherri",
    "Sherry", "Sheryl", "Shirley", "Sidney", "Simon",
    "Simone", "Sonia", "Sonja", "Sonya", "Sophia",
    "Sophie", "Spencer", "Stacey", "Stacy", "Stan",
    "Stanley", "Stefanie", "Stephanie", "Stephen", "Steve",
    "Steven", "Stewart", "Stuart", "Sue", "Susan",
    "Susanne", "Susie", "Suzanne", "Sylvia", "Tabitha",
    "Tamara", "Tammy", "Tanya", "Tara", "Tasha",
    "Taylor", "Ted", "Teddy", "Teresa", "Teri",
    "Terry", "Thelma", "Theodore", "Theresa", "Thomas",
    "Thurman", "Tiffany", "Tim", "Timothy", "Tina",
    "Toby", "Todd", "Tom", "Tommie", "Tommy",
    "Toni", "Tony", "Tonya", "Tracey", "Traci",
    "Tracie", "Tracy", "Travis", "Trent", "Trevor",
    "Trey", "Tricia", "Trina", "Trisha", "Troy",
    "Tyler", "Tyrone", "Valerie", "Vanessa", "Vera",
    "Vernon", "Veronica", "Vicki", "Vickie", "Vicky",
    "Victor", "Victoria", "Vincent", "Viola", "Violet",
    "Virgil", "Virginia", "Vivian", "Wade", "Wallace",
    "Walter", "Wanda", "Warren", "Wayne", "Wendell",
    "Wendy", "Wesley", "Whitney", "Will", "Willard",
    "William", "Willie", "Willis", "Wilson", "Winston",
    "Wm", "Woodrow", "Yolanda", "Yvonne", "Zachary",
    "Zoe"
  ]

  last_names = [
    "Smith", "Johnson", "Williams", "Brown", "Jones",
    "Garcia", "Miller", "Davis", "Rodriguez", "Martinez",
    "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson",
    "Thomas", "Taylor", "Moore", "Jackson", "Martin",
    "Lee", "Perez", "Thompson", "White", "Harris",
    "Sanchez", "Clark", "Ramirez", "Lewis", "Robinson",
    "Walker", "Young", "Allen", "King", "Wright",
    "Scott", "Torres", "Nguyen", "Hill", "Flores",
    "Green", "Adams", "Nelson", "Baker", "Hall",
    "Rivera", "Campbell", "Mitchell", "Carter", "Roberts",
    "Alexander", "Alvarez", "Andrews", "Armstrong", "Arnold",
    "Austin", "Bailey", "Barnes", "Barnett", "Barrett",
    "Bates", "Beck", "Bell", "Bennett", "Berry",
    "Black", "Blair", "Blake", "Boyd", "Bradley",
    "Brady", "Brewer", "Brooks", "Bryant", "Burke",
    "Burns", "Burton", "Bush", "Butler", "Byrd",
    "Caldwell", "Cameron", "Campbell", "Carlson", "Carpenter",
    "Carr", "Carroll", "Carson", "Carter", "Casey",
    "Castillo", "Castro", "Chambers", "Chapman", "Chavez",
    "Christensen", "Clark", "Cobb", "Cole", "Coleman",
    "Collins", "Colon", "Cook", "Cooper", "Cox",
    "Craig", "Crawford", "Cross", "Cruz", "Cummings",
    "Cunningham", "Curry", "Daniels", "Davidson", "Dawson",
    "Day", "Dean", "Delgado", "Dennis", "Diaz",
    "Dixon", "Douglas", "Doyle", "Duncan", "Dunn",
    "Eaton", "Edwards", "Elliott", "Ellis", "Evans",
    "Ferguson", "Fernandez", "Fields", "Fisher", "Fitzgerald",
    "Fleming", "Fletcher", "Floyd", "Ford", "Foster",
    "Fowler", "Fox", "Franklin", "Freeman", "Fuller",
    "Gardner", "Garrett", "Gibson", "Gilbert", "Gill",
    "Gomez", "Gonzales", "Gordon", "Graham", "Grant",
    "Graves", "Gray", "Green", "Greene", "Griffin",
    "Gross", "Guerrero", "Gutierrez", "Hale", "Hall",
    "Hamilton", "Hammond", "Hancock", "Hansen", "Hanson",
    "Harper", "Harrington", "Harris", "Harrison", "Hart",
    "Harvey", "Hawkins", "Hayes", "Haynes", "Henderson",
    "Henry", "Hernandez", "Hicks", "Higgins", "Hill",
    "Hines", "Hodges", "Hoffman", "Holland", "Holmes",
    "Holt", "Hopkins", "Horton", "Howard", "Howell",
    "Hubbard", "Hudson", "Hughes", "Hunt", "Hunter",
    "Ingram", "Jacobs", "James", "Jenkins", "Jennings",
    "Jensen", "Jimenez", "Johns", "Johnson", "Johnston",
    "Jones", "Jordan", "Joseph", "Keller", "Kelley",
    "Kelly", "Kennedy", "Kim", "King", "Klein",
    "Knight", "Lambert", "Lane", "Larson", "Lawrence",
    "Lawson", "Lee", "Leonard", "Lewis", "Lindsey",
    "Little", "Lloyd", "Logan", "Long", "Lopez",
    "Love", "Lucas", "Lynch", "Lyons", "Mack",
    "Madden", "Malone", "Mann", "Manning", "Marsh",
    "Marshall", "Martin", "Martinez", "Mason", "Matthews",
    "Maxwell", "May", "Mccarthy", "Mccoy", "Mcdaniel",
    "Mcdonald", "Mcgee", "Mckinney", "Mclaughlin", "Mcmahon",
    "Meadows", "Medina", "Mendez", "Mendoza", "Meyer",
    "Miles", "Miller", "Mills", "Mitchell", "Montgomery",
    "Moore", "Morales", "Moreno", "Morgan", "Morris",
    "Morrison", "Moss", "Mueller", "Mullins", "Munoz",
    "Murphy", "Murray", "Myers", "Nash", "Neal",
    "Nelson", "Newman", "Newton", "Nguyen", "Nichols",
    "Nicholson", "Norman", "Norris", "Norton", "Nunez",
    "Obrien", "Oconnor", "Oliver", "Olson", "Oneal",
    "Oneill", "Ortega", "Ortiz", "Osborne", "Owen",
    "Owens", "Padilla", "Page", "Palmer", "Parker",
    "Parks", "Parrish", "Parsons", "Patel", "Patrick",
    "Patterson", "Patton", "Paul", "Payne", "Pearson",
    "Peck", "Pena", "Perez", "Perkins", "Perry",
    "Peters", "Peterson", "Phelps", "Phillips", "Pierce",
    "Pittman", "Pitts", "Pollard", "Poole", "Pope",
    "Porter", "Potter", "Powell", "Powers", "Pratt",
    "Preston", "Price", "Prince", "Pruitt", "Puckett",
    "Pugh", "Quinn", "Ramirez", "Ramos", "Ramsey",
    "Randall", "Randolph", "Rasmussen", "Ratliff", "Ray",
    "Raymond", "Reed", "Reese", "Reeves", "Reid",
    "Reilly", "Reyes", "Reynolds", "Rhodes", "Rice",
    "Rich", "Richard", "Richards", "Richardson", "Richmond",
    "Riley", "Rios", "Rivas", "Rivera", "Robbins",
    "Roberson", "Roberts", "Robertson", "Robinson", "Robles",
    "Rocha", "Rodgers", "Rodriguez", "Rogers", "Rojas",
    "Rollins", "Roman", "Romero", "Rosa", "Rosales",
    "Rose", "Ross", "Roth", "Rowe", "Rowland",
    "Roy", "Ruiz", "Rush", "Russell", "Russo",
    "Rutledge", "Ryan", "Salas", "Salazar", "Salinas",
    "Sanchez", "Sanders", "Sandoval", "Sanford", "Santana",
    "Santiago", "Santos", "Sargent", "Saunders", "Savage",
    "Sawyer", "Schmidt", "Schneider", "Schroeder", "Schultz",
    "Schwartz", "Scott", "Sears", "Sellers", "Serrano",
    "Sexton", "Shaffer", "Shannon", "Sharp", "Sharpe",
    "Shaw", "Shelton", "Shepard", "Shepherd", "Sheppard",
    "Sherman", "Shields", "Short", "Silva", "Simmons",
    "Simon", "Simpson", "Sims", "Singleton", "Skinner",
    "Slater", "Small", "Smith", "Snider", "Snow",
    "Snyder", "Solis", "Solomon", "Sosa", "Soto",
    "Sparks", "Spears", "Spence", "Spencer", "Stafford",
    "Stanley", "Stanton", "Stark", "Steele", "Stein",
    "Stephens", "Stephenson", "Stevens", "Stevenson", "Stewart",
    "Stokes", "Stone", "Stout", "Strickland", "Strong",
    "Stuart", "Suarez", "Sullivan", "Summers", "Sutton",
    "Swanson", "Sweeney", "Sweet", "Sykes", "Talley",
    "Tanner", "Tate", "Taylor", "Terrell", "Terry",
    "Thomas", "Thompson", "Thornton", "Tillman", "Todd",
    "Torres", "Townsend", "Tran", "Travis", "Trevino",
    "Trujillo", "Tucker", "Turner", "Tyler", "Tyson",
    "Underwood", "Valdez", "Valencia", "Valentine", "Valenzuela",
    "Vance", "Vang", "Vargas", "Vasquez", "Vaughan",
    "Vaughn", "Vazquez", "Vega", "Velasquez", "Velazquez",
    "Velez", "Villarreal", "Vincent", "Vinson", "Wade",
    "Wagner", "Walker", "Wall", "Wallace", "Waller",
    "Walls", "Walsh", "Walter", "Walters", "Walton",
    "Ward", "Ware", "Warner", "Warren", "Washington",
    "Waters", "Watkins", "Watson", "Watts", "Weaver",
    "Webb", "Weber", "Webster", "Weeks", "Weiss",
    "Welch", "Wells", "West", "Wheeler", "Whitaker",
    "White", "Whitehead", "Whitfield", "Whitley", "Whitney",
    "Wiggins", "Wilcox", "Wilder", "Wiley", "Wilkerson",
    "Wilkins", "Wilkinson", "William", "Williams", "Williamson",
    "Willis", "Wilson", "Winters", "Wise", "Witt",
    "Wolf", "Wolfe", "Wong", "Wood", "Woodard",
    "Woods", "Woodward", "Wooten", "Workman", "Wright",
    "Wyatt", "Wynn", "Yang", "Yates", "York",
    "Young", "Zamora", "Zimmerman"
  ]

  "#{first_names.sample} #{last_names.sample}"
end

# Helper method to generate random equipment name
def random_equipment_name
  equipment_types = [
    "Laptop", "Desktop", "Printer", "Scanner", "Projector",
    "Camera", "Server", "Router", "Switch", "Monitor",
    "Keyboard", "Mouse", "External Hard Drive", "USB Hub", "Webcam",
    "Microphone", "Speaker", "Headset", "Drawing Tablet", "Docking Station",
    "Firewall", "NAS Drive", "KVM Switch", "UPS", "VR Headset",
    "Smartphone", "Tablet", "Smartwatch", "E-Reader", "PDA",
    "Fax Machine", "Photocopier", "Label Maker", "Laminator", "Shredder",
    "Workstation", "Thin Client", "Modem", "Network Extender", "Patch Panel",
    "Server Rack", "Tape Drive", "Barcode Scanner", "POS Terminal", "Cash Register",
    "ATM", "Kiosk", "Digital Signage", "Video Wall", "Conference Phone",
    "Intercom", "Paging System", "Walkie Talkie", "VoIP Phone", "Satellite Phone",
    "Security Camera", "DVR", "NVR", "Access Control", "Alarm System",
    "Metal Detector", "X-Ray Scanner", "3D Printer", "CNC Machine", "Laser Cutter",
    "Oscilloscope", "Spectrum Analyzer", "Signal Generator", "Multimeter", "Power Supply",
    "Test Chamber", "Soldering Station", "Microscope", "Telescope", "Centrifuge",
    "Autoclave", "Fume Hood", "PCR Machine", "Mixer", "Pipette",
    "Chiller", "Freezer", "Incubator", "Fermenter", "Bioreactor",
    "Sequencer", "Spectrophotometer", "Microtome", "Sonicator", "Lyophilizer",
    "Homogenizer", "Hot Plate", "Magnetic Stirrer", "Rotary Evaporator", "Titrator",
    "Calorimeter", "Conductivity Meter", "Dissolved Oxygen Meter", "pH Meter", "Refractometer",
    "Viscometer", "Colorimeter", "Densitometer", "Fluorometer", "Hygrometer",
    "Air Purifier", "Anemometer", "Audio Mixer", "Barcode Printer", "Blood Analyzer",
    "Bluetooth Adapter", "Body Camera", "Bone Densitometer", "Breathalyzer", "Cable Tester",
    "CAD Workstation", "Card Reader", "Cash Drawer", "Chemical Analyzer", "Chromatograph",
    "Climate Chamber", "Coagulometer", "Coin Sorter", "Color Printer", "Combustion Analyzer",
    "Concrete Mixer", "Convection Oven", "Cooling Tower", "Copier", "Cryostat",
    "Data Logger", "Defibrillator", "Dehumidifier", "Dialysis Machine", "Die Cutter",
    "Digital Multimeter", "Digital Signage Player", "Distillation Unit", "Document Camera", "Drone",
    "Dry Ice Maker", "ECG Machine", "Electric Stapler", "Electrolyte Analyzer", "EMF Meter",
    "Ethernet Card", "Fiber Optic Tester", "Fingerprint Scanner", "Flow Meter", "Food Processor",
    "Frequency Counter", "Fuel Cell Tester", "Gas Chromatograph", "Gas Detector", "Geiger Counter",
    "Glucose Meter", "GPS Tracker", "Graphing Calculator", "Gyroscope", "Heat Gun",
    "Hematology Analyzer", "Humidifier", "Ice Maker", "Infrared Camera", "Inkjet Printer",
    "Insulin Pump", "IV Pump", "Joystick", "Karaoke Machine", "Label Printer",
    "Laser Pointer", "Laser Scanner", "LCD Projector", "Light Meter", "Mass Spectrometer",
    "Metal Printer", "Microfilm Reader", "Microwave Oven", "Moisture Analyzer", "Money Counter",
    "MRI Scanner", "Network Analyzer", "Note Counter", "Optical Drive", "Oscillator",
    "Oxygen Concentrator", "Particle Counter", "Payment Terminal", "pH Probe", "Photo Printer",
    "Plasma Cutter", "Polarimeter", "Portable Generator", "Power Amplifier", "Pressure Cooker",
    "Proximity Sensor", "Pulse Oximeter", "Radiation Detector", "RF Signal Generator", "Robotic Arm",
    "Satellite Dish", "Seismometer", "Sewing Machine", "Signal Booster", "Smoke Detector",
    "Sous Vide Cooker", "Spectrometer", "Stethoscope", "Stir Plate", "Strobe Light",
    "Surface Tester", "Table Saw", "Thermal Camera", "Thermal Cycler", "Time Clock",
    "Treadmill", "Ultrasonic Cleaner", "Vacuum Pump", "Vending Machine", "Ventilator",
    "Vibration Meter", "Video Encoder", "Water Bath", "Water Filter", "Weather Station",
    "Weighing Scale", "Welding Machine", "Wi-Fi Extender", "X-Ray Machine", "Zinc Analyzer"
  ]
  equipment_types.sample
end



# Helper method to generate random created_at date
def random_created_at
  Time.at(rand(Time.parse("2013-10-01 00:00:00 UTC").to_f..Time.parse("2023-10-01 00:00:00 UTC").to_f))
end

# Create HR Staff
250.times do |i|
  name = random_name.split
  HrStaff.create(
    first_name: name[0],
    last_name: name[1],
    created_at: random_created_at,
    email: "#{name[0]}.#{name[1]}@devry.edu",
    password: '12345678',
    password_confirmation: '12345678'
  )
  puts "HrStaff #{i + 1} created."
  
end

# Create Maintenance Staff
250.times do |i|
  name = random_name.split
  MaintenanceStaff.create(
    first_name: name[0],
    last_name: name[1],
    created_at: random_created_at,
    email: "#{name[0]}.#{name[1]}@devry.edu",
    password: '12345678',
    password_confirmation: '12345678'
  )
  puts "MaintenanceStaff #{i + 1} created."
end

# Create Management Staff
250.times do |i|
  name = random_name.split
  ManagementStaff.create(
    first_name: name[0],
    last_name: name[1],
    created_at: random_created_at,
    email: "#{name[0]}.#{name[1]}@devry.edu",
    password: '12345678',
    password_confirmation: '12345678'
  )
  puts "ManagementStaff #{i + 1} created."
end

# Helper method to generate random equipment ID
def random_equipment_id
  "EQP#{SecureRandom.hex(4).upcase}"
end


# Create Equipment Inventory
1000.times do |i|
  random_maintenance_staff = MaintenanceStaff.order("RANDOM()").first
  equipment = EquipmentInventory.create(
    equipment_name:        random_equipment_name,
    equipment_id:          random_equipment_id,
    status:                rand(2),
    maintenance_staffs_id: random_maintenance_staff.id,
    created_at:            random_created_at,
    last_checked_in_at:    random_created_at,
    last_checked_out_at:   random_created_at
  )
  puts "EquipmentInventory #{i + 1} created."
  
  EquipmentMovement.create!(
    equipment_inventory_id: equipment.id,
    maintenance_staff_id: random_maintenance_staff.id,
    moved_at: Time.now,
    action: 'created'
  )
  puts "EquipmentMovement #{i + 1} created."
end

# ================================================================
# Helper method to generate random report type and check-in status
# ----------------------------------------------------------------
def random_report_type_and_status
  types = ['Removed', 'Checked In', 'Checked Out', 'All']
  selected_type = types.sample
  status = case selected_type
           when 'Removed'     then -1
           when 'Checked In'  then 0
           when 'Checked Out' then 1
           else nil
           end
  [selected_type, status]
end


# Create Reports
100.times do |i|
  random_management_staff  = ManagementStaff.order("RANDOM()").first
  random_maintenance_staff = MaintenanceStaff.order("RANDOM()").first
  random_date_range_start  = rand(10.years).seconds.ago.strftime("%Y-%m-%d")
  random_date_range_end    = rand(1.year).seconds.from_now.strftime("%Y-%m-%d")
  report_type, status      = random_report_type_and_status

  begin
    Report.create!(
      report_type:           report_type,
      management_staffs_id:  random_management_staff.id,
      maintenance_staffs_id: random_maintenance_staff.id,
      check_in_status:       status,
      start_date:            random_date_range_start,
      end_date:              random_date_range_end,
      created_at:            random_created_at
    )
    puts "Report #{i + 1} created."
  rescue => e
    puts "Failed to create Report #{i + 1}: #{e.message}"
  end
end
