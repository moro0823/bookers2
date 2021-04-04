class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    # フォローするuserのidをuserテーブルに関連づける
    # どのユーザーからフォローしたか分かる
    belongs_to :followed, class_name: "User"
    # フォローされたuserのidをuserテーブルに関連づける
    # どのユーザーからフォローされたか分かる
end