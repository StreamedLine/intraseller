module BulletHelper
	def parent_path(bullet)
		send("#{bullet.bulletable_type.downcase}_path", bullet.bulletable)
	end
end