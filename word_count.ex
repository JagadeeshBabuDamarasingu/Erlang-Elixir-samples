defmodule WordCount do

  # Starting point
  def start() do
    choice = IO.gets(
      """
        Namaste! Please Enter your Choice:
               "word":       Count Words in File
               "lines":      Count Lines in File
               "characters": Count Characters in File


      """
    )
    case String.trim(choice) do
      "word" -> count_words()
      "lines" -> count_lines()
      "characters" -> count_characters()
      _ -> IO.puts ~s{"Enter one of following choices, "words", "lines", "characters"}
           start()
    end
  end

  # Counts for words in a given file
  def count_words() do
    get_file_stream()
    |> String.split(~r{(\\n|[^\w'])+})
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.count
    |> IO.puts
  end

  # Counts for characters in a given file
  def count_characters() do
    get_file_stream()
    |> String.replace(~r{(\\n|[^\w'])+}, "")
    |> String.length()
    |> IO.puts
  end

  # Counts for lines in a given file
  def count_lines() do
    get_file_stream()
    |> String.split(~r{(\n)})
    |> Enum.count()
    |> IO.puts
  end

  def get_file_stream() do
    String.trim(IO.gets("Please enter file name: "))
    |> File.read!
  end
end