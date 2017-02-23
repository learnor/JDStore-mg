module ApplicationHelper
  def profile_avatar_select(user)
    if user.avatar.exists?
      image_tag @user.avatar.url(:medium),
                id: 'image-preview',
                class: 'img-responsive img-circle profile-image'
    else
      image_tag 'default-avatar.jpg', id: 'image-preview',
                                      class: 'img-responsive img-circle profile-image'
    end
  end
end
