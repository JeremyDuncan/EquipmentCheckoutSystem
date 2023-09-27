# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create HR Staff
5.times do |i|
  HrStaff.create(
    first_name: "John#{i}",
    last_name: "Doe#{i}",
    role: "HR Manager"
  )
end

# Create Maintenance Staff
5.times do |i|
  MaintenanceStaff.create(
    first_name: "Jane#{i}",
    last_name: "Doe#{i}"
  )
end

# Create Management Staff
5.times do |i|
  ManagementStaff.create(
    first_name: "Emily#{i}",
    last_name: "Smith#{i}",
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

# Create Equipment Inventory
5.times do |i|
  EquipmentInventory.create(
    equipment_name: "Laptop#{i}",
    equipment_id: "LAP123#{i}",
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

