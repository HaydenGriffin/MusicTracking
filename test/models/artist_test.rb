require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

	test 'should not save empty task' do
		artist = Artist.new

		artist.save
		refute artist.valid?
	end

	test 'should save valid task' do
		artist = Artist.new
		artist.name = 'Artist 1'
		artist.save
		assert artist.valid?
	end
end
