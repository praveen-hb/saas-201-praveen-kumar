class Section
	attr_accessor :st_list, :num,:name
	def initialize(name)
		@name=name
		self.st_list=[]
		self.num=0
	end
	def add(st_name)
		self.st_list.push(st_name)
		self.num+=1
		self.st_list.sort! {|a, b| a <=> b }
		self.st_list.index(st_name) + 1
	end
end

