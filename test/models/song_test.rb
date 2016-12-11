require 'test_helper'

class SongTest < ActiveSupport::TestCase

	setup do
		@album = albums(:one)
	end

	test 'should not save song' do
		song = Song.new
		song.save
		refute song.valid?
	end

	test 'should not save song no name' do
		song = Song.new
		song.length = '4:31'
		song.save
		refute song.valid?
	end

	test 'should not save song invalid length' do
		song = Song.new
		song.name = 'Song 1'
		song.length = 'Hello'
		song.album = @album
		song.save
		refute song.valid?
	end

  test 'should save valid song' do
		song = Song.new
		song.name = 'Song 1'
		song.length = '3:31'
		song.album = @album
		song.save
		assert song.valid?
	end
end
