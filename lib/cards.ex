defmodule Cards do
  @moduledoc """  
  Provides methods for creating and handling a deck of Cards.
  """
    
  @doc """
  You should ignore this as it has nothing to do with the project, but rather
  the result of failure to resist the urge to delete it.
  """
  def hello do
    "Olatinpo Bobo"
  end

  @doc """

  Please ignore as it has no effect with the project. it is only a representation of 
  wish to practice testing at the onset of this project.
  """
  def location(x, y) do
      x * y / 4
  end

  @doc """
  Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Other"]
    suits = ["Spades", "Diamond", "Clubs", "Gold", "Silver", "Jubilee", "Rest"]
    
    for suit <- suits, value <- values do
       "#{value} of #{suit}"
      end
  end

  def shuffle(deck) do
      Enum.shuffle(deck)
  end

  @doc """
  This confirms with either Tue or False if a particular card is present or not in the deck.

  ## Examples

      iex(1)> deck = Cards.create_deck
      iex(2)> Cards.confirm(deck, "Ace")
      false
      iex(3)> Cards.confirm(deck, "Ace of Spades")
      true

  """
  def confirm(deck, card) do
    Enum.member?(deck, card)
  end 

  @doc """
    Divides a deck into a hand and the remainder of the deck. 
    The hand_size argument indicate how many cards should be in the hand.

  ## Examples

      iex(1)> deck = Cards.create_deck
      iex(2)> Cards.handle(deck, 5)
      iex(3)> {hand, deck} = Cards.handle(deck, 5)
      iex(4)> hand
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades"]

  """
  def handle(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason}-> "That file you are looking for is under your bed and not here"
    end
  end


  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.handle(hand_size)
  end
end
