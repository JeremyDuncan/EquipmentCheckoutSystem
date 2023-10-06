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

# Helper method to generate random equipment ID
def random_equipment_id
  "EQP#{SecureRandom.hex(4).upcase}"
end


# Create Equipment Inventory
150000.times do |i|
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