defmodule Calculator do
	@moduledoc """
	A calculator module which provides basic arithmetric operations.
	"""
	
	@doc """
	Adds 2 numbers.
	"""
	def add(a, b), do: a + b
	
	@doc """
	Subtracts 2 numbers.
	"""	
	def subtract(a, b), do: a - b
	
	@doc """
	Multiplies 2 numbers.
	"""	
	def multiply(a, b), do: a * b

	@doc """
	Divides the first number by the second.
	Handles division by zero by returning an error message.
	"""
	def divide(a, b) when b != 0 and b != 0.0, do: a / b
	def divide(_, b) when b == 0 or b == 0.0, do: "Error: Division by zero"
	
	@doc """
	Runs the calculator interface, which prompts user for input values and displays the result.
	"""
	def calculate do
		IO.puts "Simple Calculator"
		IO.puts "Enter your calculation, eg: 3 + 5"
		input = IO.gets("") |> String.trim()
		
		case String.split(input, " ") do
			[num1, op, num2] ->
				n1 = parse_number(num1)
				n2 = parse_number(num2)
				result = perform_operation(n1, op, n2)
				IO.puts "Result: #{result}"
			_ ->
				IO.puts "Invalid input. Please try again."
		end
	end
	
	#Private helper functions
	
	@doc false #This function will not appear in generated docs
	defp parse_number(str) do
		case Float.parse(str) do
			{num, ""} -> num
			:error ->
				case Integer.parse(str) do
					{num, ""} -> num / 1
					_ -> raise "Invalid number: #{str}"
				end
		end
	end
		
		@doc false # This function will not appear in generated docs.
		defp perform_operation(a, "+", b), do: add(a, b)
		defp perform_operation(a, "-", b), do: subtract(a, b)
		defp perform_operation(a, "*", b), do: multiply(a, b)
		defp perform_operation(a, "/", b), do: divide(a, b)
		defp perform_operation(_, _, _), do: "Error: Operation is invalid."
	end
		
