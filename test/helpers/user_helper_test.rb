require 'test_helper'

class UserHelperTest < ActionView::TestCase
  test "should return main handle on non-anon track" do
    user = create :user
    user_track = create :user_track, user: user
    assert_dom_equal user.handle, display_name(user, user_track)
  end

  test "should return Anonymous on anon track" do
    anon_handle = "Foobar"
    user = create :user
    user_track = create :user_track, user: user, anonymous: true, handle: anon_handle
    assert_dom_equal anon_handle, display_name(user, user_track)
  end

  test "should return Anonymous on anon track with profile" do
    anon_handle = "Foobar"
    user = create :user
    create :profile, user: user
    user_track = create :user_track, user: user, anonymous: true, handle: anon_handle
    assert_dom_equal anon_handle, display_name(user, user_track)
  end

  test "should return profile link on non-anon track with profile" do
    anon_handle = "Foobar"
    user = create :user
    profile = create :profile, user: user
    user_track = create :user_track, user: user
    assert_dom_equal link_to(user.handle, profile), display_name(user, user_track)
  end


end
