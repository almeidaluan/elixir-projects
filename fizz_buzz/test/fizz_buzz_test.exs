defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "When a not valid file is provided, returns the error list" do
      expected_response = {:error, "Error reading file: enoent"}
      assert FizzBuzz.build("numeross.txt") == expected_response
    end

    test "When a valid file is provided, returns the list" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :fizz, 7, :fizzbuzz]}
      assert FizzBuzz.build("numeros.txt") == expected_response
    end
  end
end
