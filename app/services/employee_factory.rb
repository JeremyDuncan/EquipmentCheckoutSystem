# ==============================================================================
# The EmployeeFactory class serves as a factory for creating employee objects.
# ------------------------------------------------------------------------------
class EmployeeFactory
  class << self
    # ============================================================================
    # This class method 'create_employee' takes in a type symbol and attributes
    # hash to create a new employee object based on the type.
    # Params:
    # type => employee to create (:hr, :maintenance, :management)
    # attributes => Hash containing attributes for the new employee
    # Returns => An instance of the appropriate employee class, populated with the 
    # given attributes
    # ----------------------------------------------------------------------------
    def create_employee(type, attributes)
      ##########################################################
      ## SET DEFAULT EMAIL AND PASSWORD FOR DEMONSTRATING USE ##
      ########################################################## 
      attributes[:email]    ||= "placeholder@dev.com"
      attributes[:password] ||= "devry1234"
      case type
      when 'HrStaff'
        HrStaff.create!(attributes)
      when 'MaintenanceStaff'
        MaintenanceStaff.create!(attributes)
      when 'ManagementStaff'
        ManagementStaff.create!(attributes)
      else
        raise "Invalid employee type"
      end
    end
  end
end
