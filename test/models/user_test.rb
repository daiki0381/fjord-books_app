# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'following?' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test 'followed_by?' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not bob.followed_by?(alice)
    alice.follow(bob)
    assert bob.followed_by?(alice)
  end

  test 'follow' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test 'unfollow' do
    alice = users(:alice)
    bob = users(:bob)
    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test 'name_or_email' do
    alice = users(:alice)
    alice.name = 'Alice'
    assert_equal 'Alice', alice.name_or_email

    bob = users(:bob)
    alice.name = ''
    assert_equal 'bob@example.com', bob.name_or_email
  end
end
