##
# Monkeypatches Devise's `bypass_sign_in` to use `warden.set_user` with `store: false`,
# avoiding Warden's session store. This is intended for token-based auth only,
# where session storage is unnecessary. Inspired by Ayush Newatia’s post on
# monkeypatching in Rails (uses `prepend` to override behavior cleanly).
# Reference: https://github.com/lynndylanhurley/devise_token_auth/issues/1616
module CoreExtensions
  module SignInOut
    # Same as the one implemented in devise except it skips the session store
    # Reference: https://github.com/heartcombo/devise/blob/fec67f98f26fcd9a79072e4581b1bd40d0c7fa1d/lib/devise/controllers/sign_in_out.rb#L65
    def bypass_sign_in(resource, scope: nil)
      scope ||= Devise::Mapping.find_scope!(resource)
      expire_data_after_sign_in!
      warden.set_user(resource, { store: false }.merge!(scope: scope))
    end
  end
end
