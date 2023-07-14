# Welcome message
puts "******** WELCOME TO ISMAIL'S BANK **********"
puts
puts "Hello, what is your name?"
name = gets.chomp

puts "Welcome to our bank, #{name}"

class ATM
  def initialize(balance, pin)
    @balance = balance
    @pin = pin
  end

  def deposit(amount)
    if pin_validated?
      @balance = @balance +  amount
      puts "You deposited $#{amount}. Now your current balance is: $#{@balance}"
    end
  end

  def balance
    if pin_validated?
      puts "Your current balance is $#{@balance}"
    else
      puts "PIN validation is not valid. Set your PIN first."
    end
  end

  def withdraw(amount)
    if pin_validated?
      if @balance >= amount
        @balance = @balance - amount
        puts "Your withdraw amount is $#{amount}. Your current balance is $#{@balance}"
      else
        puts "Insufficient balance. Your current balance is $#{@balance}"
      end
    end
  end

  def set_pin(pin)
    @pin = pin
    puts "Hello you sucessfully registered a pin"
  end

  private

  def pin_validated?
    print("Enter your PIN: ")
    entered_pin = gets.chomp.to_i
    entered_pin == @pin
  end
end

# Create an instance of ATM
first_atm = ATM.new(0, nil)

# Set PIN
print "Set your PIN: "
pin = gets.chomp.to_i
first_atm.set_pin(pin)

# Loop for the menu options
loop do
  puts "Welcome to the menu"
  puts "1: Deposit"
  puts "2: Check Balance"
  puts "3: Withdraw"
  puts "4: Exit"
  print "Enter your choice: "

  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter the amount to deposit: $"
    amount = gets.chomp.to_f
    first_atm.deposit(amount)
  when 2
    first_atm.balance
  when 3
    print "Enter the amount to withdraw: $"
    amount = gets.chomp.to_f
    first_atm.withdraw(amount)
  when 4
    puts "Thank you for using our services at Ismail's bank. Goodbye!"
    break
  else
    puts "Please try again."
  end
end
