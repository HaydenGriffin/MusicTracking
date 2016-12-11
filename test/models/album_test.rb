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

	test 'should not save album no name' do
		album = Album.new
		album.artist = @artist
		album.year = 2000
		album.save
		refute album.valid?
	end

	test 'should not save album invalid year' do
		album = Album.new
		album.name = 'Dark Side of The Moon'
		album.artist = @artist
		album.year = 1800
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
