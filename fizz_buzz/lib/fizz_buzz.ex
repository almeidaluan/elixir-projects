defmodule FizzBuzz do
  def build(file_name) do
    # file = File.read(file_name)
    # handle_file_read(file)

    file_name
    |> File.read()
    |> handle_file_read()
  end

  # def handle_file_read({:ok, result}), do: result
  defp handle_file_read({:ok, result}) do
    list_string_file = String.split(result, ",")
    list_string = list_string_file -- ["8\r\n"]

    result =
      list_string
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number

  defp handle_file_read({:error, reason}), do: {:error, "Error reading file: #{reason}"}
end
