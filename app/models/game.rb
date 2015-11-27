class Game < ActiveRecord::Base

	CARD_DESCKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']*6 #6 Decks

	has_many :steps #each step of the game 

	before_save :game_status #update game score on each step and save result 

	# shuffle card and give to user in first round
	def get_cards
		cards = shuffle_cards
		cards[0..2]
	end

	# check if game completed or not and provide next card to game
	def hit_or_stand(step_type)
		if completed?
			nil
		else	
			step = {step_type: step_type, p_card: '', d_card: '',game_id: self.id}
			step_card = shuffle_cards.last.to_s
			if step_type == 'hit'
				step[:p_card] = step_card
			else
				step[:d_card] = step_card
			end
			Step.create(step)
			step_card
		end	
	end

	#update game status 
	def game_status
		game_result = self.check_result
		self.result = game_result if game_result.present?
	end
		
	#check game result
	def check_result
		if self.d_score == 21 || self.p_score > 21
			'Dealer Win'
		elsif self.p_score == 21 || self.d_score > 21
			'Player Win'
		elsif self.d_score > 16# && self.p_score > 16
			if self.d_score == self.p_score
			  'Match Draw'
			elsif self.d_score > self.p_score 
				'Dealer Win'
			else
			    'Player win'
			end	
		else
			''
		end		
	end	

	#check game completed or not
	def completed?
		self.result.present? ? true : false
	end

	#game result 
	def game_result
		self.result.present? ? self.result : 'No Result'
	end

	#intialize game and first step
	def self.start
		game = Game.create(p_score: 0, d_score: 0, price: 10)
		card = game.get_cards
		game.steps.create(p_card: card[0..1].join(','), d_card: card[2],step_type: 'hit')
		game
	end

	private
	#shuffle cards before giving to game
	def shuffle_cards
		CARD_DESCKS.shuffle.shuffle
	end		
end
