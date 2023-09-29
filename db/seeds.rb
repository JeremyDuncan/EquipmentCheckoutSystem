# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# db/seeds.rb

# Helper method to generate random names
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
    "Jerry", "Katie", "Louis", "Mandy", "Neil"
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
    "Rivera", "Campbell", "Mitchell", "Carter", "Roberts"
  ]

  "#{first_names.sample} #{last_names.sample}"
end

# Helper method to generate random roles
def random_role
  roles = ["HR Manager", "HR Assistant", "HR Analyst"]
  roles.sample
end

# Create HR Staff
100.times do
  name = random_name.split
  HrStaff.create(
    first_name: name[0],
    last_name: name[1],
    role: random_role
  )
end

# Create Maintenance Staff
100.times do
  name = random_name.split
  MaintenanceStaff.create(
    first_name: name[0],
    last_name: name[1]
  )
end

# Create Management Staff
100.times do
  name = random_name.split
  ManagementStaff.create(
    first_name: name[0],
    last_name: name[1],
    role: "CEO"
  )
end

# Create Employee Records
HrStaff.all.each do |hr_staff|
  EmployeeRecord.create(
    employee_id: hr_staff.id,
    employee_type: "HrStaff",
    status: 0,
    last_updated_by: 1
  )
end

MaintenanceStaff.all.each do |maintenance_staff|
  EmployeeRecord.create(
    employee_id: maintenance_staff.id,
    employee_type: "MaintenanceStaff",
    status: 0,
    last_updated_by: 1
  )
end

ManagementStaff.all.each do |management_staff|
  EmployeeRecord.create(
    employee_id: management_staff.id,
    employee_type: "ManagementStaff",
    status: 0,
    last_updated_by: 1
  )
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
    "Viscometer", "Colorimeter", "Densitometer", "Fluorometer", "Hygrometer"
  ]

  equipment_types.sample
end

# Helper method to generate random equipment ID
def random_equipment_id
  "EQP#{SecureRandom.hex(4).upcase}"
end

# Create Equipment Inventory
100.times do
  EquipmentInventory.create(
    equipment_name: random_equipment_name,
    equipment_id: random_equipment_id,
    status: 0,
    maintenance_staffs_id: MaintenanceStaff.first.id
  )
end

# Create Reports
5.times do |i|
  Report.create(
    report_type: "Monthly",
    management_staffs_id: ManagementStaff.first.id,
    date_range: "2023-01-01 to 2023-01-31",
    metrics_included: "All"
  )
end

