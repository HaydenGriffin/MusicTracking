require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

	setup do
		@artist = artists(:one)
	end

	test 'should not save album' do
		album = Album.new
		album.save

		refute album.valid?
	end

	test 'should save album' do
		album = Album.new
		album.name = 'Dark Side of The Moon'
		album.artist = @artist
		album.year = 2000
		album.save

		assert album.valid?
	end
end
