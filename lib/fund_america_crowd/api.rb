module FundAmericaCrowd
	module Api
		def create_entities options
			get_response(:post, 'entities', options)
		end

    def create_offerings options
      get_response(:post, 'offerings', options)
    end

		def create_escrow_agreements options
			get_response(:post, 'escrow_agreements', options)
		end
		
		def create_escrow_service_applications options
      get_response(:post, 'escrow_service_applications', options)
    end

		def create_investments options
      get_response(:post, 'investments', options)
    end
    
    def create_ach_tokens options
      get_response(:post, 'ach_tokens', options)
    end

		private

		def formatted_time(time)
	      time && time.strftime('%Y-%m-%d %H:%M:%S')
	    end

	    def formatted_date(date)
	      date && date.strftime('%Y-%m-%d')
	    end

	    def boolean_to_y_n(bool)
	      bool ? 'Y' : 'N'
	    end

	    def boolean_to_yes_no(bool)
	      bool ? 'Yes' : 'No'
	    end

		def get_response(method, endpoint, data)
			ignore_exceptions = data.has_key?(:ignore_exceptions) && data.delete(:ignore_exceptions)	
	      	response = FundAmericaCrowd.connection.__send__(method, endpoint, data)
	      	unless ignore_exceptions
		    	if response['error'] != nil
		        	raise FundAmericaCrowd::Error.new(response['error'])
		      	end
		  	end
	      	response
    	end

    	def object_from_response(klass, method, endpoint, data)
      		klass.from_response(get_response(method, endpoint, data))
    	end
	end
end