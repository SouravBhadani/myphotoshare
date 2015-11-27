class Step < ActiveRecord::Base
  belongs_to :game
  before_create :update_game_score

  SCORE = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10,
  			'K' => 10, 'A' => 11, '' => 0, nil => 0
  		}

  #update game score on each step
  def update_game_score
  	game = self.game
  	game.d_score = game.d_score + get_score(d_card)
  	game.p_score = game.p_score + get_score(p_card)
  	game.save
  end

  def player_cards
  	self.p_card.split(',')
  end
  
  def dealer_cards
  	self.d_card.split(',')
  end	

  private
  #getting player and dealer score from SCORE constant
  def get_score(cards)
  	cards = cards.to_s.split(',')
  	(cards.size == 1) ? SCORE[cards[0]] : SCORE[cards[0]] + SCORE[cards[1]]
  end	
end