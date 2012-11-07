Basic_Strategy = require('./basic_strategy').Basic_Strategy
Advanced_Strategy = require('./advanced_strategy').Advanced_Strategy

class AI_Selector
	select: (type) ->
		switch type
			when "basic" then new Basic_Strategy
			else new Advanced_Strategy

root = exports ? window
root.AI_Selector = AI_Selector