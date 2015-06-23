require 'spec_helper'

describe FundAmericaCrowd do
  before do
    FundAmericaCrowd.configure do |config|
      config.base_url = 'https://sandbox.fundamerica.com/api/'
      config.api_key = 'WY0EIfchfdEwDonUJNngLVrIrIecP9T3'
      #config.api_secret = '10f5ff9090'
    end
  end

  it 'should create an investor and return its id' do
    WebMock.stub_request(
      :post,
      "https://sandbox.fundamerica.com/api/"
    ).to_return(
      :status => 200
    )
    begin
      data = FundAmericaCrowd.create_entities({
        :city => 'New York',
        :country=>'US',
        :email=>'sajil@nefund.co',
        :name=>'Sajil Koroth2',
        :phone=>'12025551212',
        :postal_code=>'10005',
        :region=>'NY',
        :street_address_1=>'Somewhere ',
        :tax_id_number=>'999999999',
        :type=>'person',
        :executive_name=>'Sajil Koroth',
        :region_formed_in=>'NY',
        :ignore_exceptions =>'No',
        :date_of_birth =>'1978-01-14'
      })
    rescue Exception => e
      puts e
    end 
    puts data
    #data.should be_an_instance_of(FundAmericaCrowd::Id)
  end

  # it 'should create a company and return its id' do
    # WebMock.stub_request(
      # :post,
      # "https://sandbox.fundamerica.com/api/"
    # ).to_return(
      # :status => 200
    # )
    # begin
      # data = FundAmericaCrowd.create_issuer({
        # :city => 'New York',
        # :country=>'US',
        # :email=>'sajil.k@xxx.co',
        # :name=>'XXX',
        # :phone=>'12025551212',
        # :postal_code=>'10005',
        # :region=>'NY',
        # :street_address_1=>'Somewhere Offering1 ',
        # :tax_id_number=>'999999999',
        # :type=>'company',
        # :executive_name=>'Sajil Koroth',
        # :region_formed_in=>'NY',
        # :ignore_exceptions =>'No',
      # })
    # rescue Exception => e
      # puts e
    # end 
    # @issuer_id = data['id']
    # puts @issuer_id
    # #data.should be_an_instance_of(FundAmericaCrowd::Id)
  # end
  
  # it 'should create an offering' do
    # WebMock.stub_request(
      # :post,
      # "https://sandbox.fundamerica.com/api/"
    # ).to_return(
      # :status => 200
    # )
    # begin
      # data = FundAmericaCrowd.create_offerings({
        # :amount => '5000000',
        # :description => 'A june 20 Deal Offering16',
        # :max_amount => '10000000.00',
        # :min_amount => '20000.00'  ,
        # :name => 'XXX June 20 Deal 16'  ,
        # :entity =>{
          # :city =>'New York',
          # :country=>'US',
          # :email=>'sajil.k@xxx.com',
          # :name=>'XXX',
          # :phone=>'12025551212',
          # :postal_code=>'10005',
          # :region=>'NY',
          # :street_address_1=>'Somewhere Offering1 ',
          # :tax_id_number=>'999999999',
          # :type=>'company',
          # :executive_name=>'Sajil Koroth',
          # :region_formed_in=>'NY',
          # :ignore_exceptions =>'No'
        # }
      # })
    # rescue Exception => e
      # puts e
    # end 
    # @offering_id = data['id']
# 
    # WebMock.stub_request(
      # :post,
      # "https://sandbox.fundamerica.com/api/"
    # ).to_return(
      # :status => 200
    # )
    # begin
      # data = FundAmericaCrowd.create_escrow_agreements({
        # :offering_id => @offering_id
      # })
    # rescue Exception => e
      # puts e
    # end 
    # @escrow_agreement_id = data['id']
   # puts data
  # end
  
  # it 'should create create_escrow_service_applications' do
   # WebMock.stub_request(
      # :post,
      # "https://sandbox.fundamerica.com/api/"
    # ).to_return(
      # :status => 200
    # )
    # begin
      # data = FundAmericaCrowd.create_escrow_service_applications({
        # :offering_id => 'bfpAdoLQTSi73FKqHOWtfQ',
        # :escrow_agreement_id=>'z-x_rsgCTLCUeqFIbbrU_A',
        # :ppm_url=>'http://www.example.com/ppm.html'
      # })
    # rescue Exception => e
      # puts e
    # end 
    # @escrow_service_application_id = data['id']
    # puts data
   # end
#    
   # it 'should create investments' do
   # WebMock.stub_request(
      # :post,
      # "https://sandbox.fundamerica.com/api/"
    # ).to_return(
      # :status => 200
    # )
    # begin
      # data = FundAmericaCrowd.create_investments({
        # :amount => '234000.00',
        # :entity_id => 'v_PQ-HE8QTKoslZaF6JNHA',
        # :equity_share_count=>'10',
        # :offering_id => 'bfpAdoLQTSi73FKqHOWtfQ',
        # :payment_method => 'wire'
      # })
    # rescue Exception => e
      # puts e
    # end 
    # @escrow_service_application_id = data['id']
    # puts data
   # end
   
   # it 'should create ach token' do
   # WebMock.stub_request(
      # :post,
      # "https://sandbox.fundamerica.com/api/"
    # ).to_return(
      # :status => 200
    # )
    # begin
      # data = FundAmericaCrowd.create_ach_tokens({
        # :entity_id => 'v_PQ-HE8QTKoslZaF6JNHA',
        # :ach_authorization =>{
        # :account_type => "checking",
        # :check_type => "business",
        # :account_number => "12312312",
        # :routing_number => "123123123"
      # }
      # })
    # rescue Exception => e
      # puts e
    # end 
    # @escrow_service_application_id = data['id']
    # puts data
   # end
  
end