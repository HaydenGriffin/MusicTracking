require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

	test 'should not save artist' do
		artist = Artist.new
		artist.save
		refute artist.valid?
	end

	test 'should not save artist invalid year' do
		artist = Artist.new
		artist.name = 'Artist 1'
		artist.start = 1850
		artist.save
		refute artist.valid?
	end

	test 'should save valid artist' do
		artist = Artist.new
		artist.name = 'Artist 1'
		artist.start = 2000
		artist.save
		assert artist.valid?
	end
end
