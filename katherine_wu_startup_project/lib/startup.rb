require "employee"
require "byebug"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee, title)
        raise "not a valid title" if !valid_title?(title)
        @employees << Employee.new(employee, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        amt = @salaries[employee.title]
        if @funding > amt
            employee.pay(amt)
            @funding -= amt
        else raise "startup does not have enough funding"
        end
    end

    def payday
        @employees.each{|employee| pay_employee(employee)}
    end

    '''
    '''
    # PART 3
    '''
    '''
    def average_salary
        @employees.map{|employee| @salaries[employee.title]}.sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        # debugger
        @funding += other_startup.funding
        other_startup.salaries.each{|ttl, sal| @salaries[ttl] = sal if !valid_title?(ttl)}
        @employees += other_startup.employees
        other_startup.close
    end


end
