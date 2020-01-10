require_relative './section'
class Department
	attr_accessor :deptname,:a,:b,:c,:total
	def initialize(deptt)
		self.a=Section.new("A")
		self.b=Section.new("B")
		self.c=Section.new("C")
		self.deptname=deptt
		@total=0
	end
	def enroll(namee)
		roll=""
		sec=""
	if a.num<10
		roll=a.add(namee)
		sec='A'
	elsif b.num<10
		roll=b.add(namee)
		sec='B'
	elsif c.num<10
		roll=c.add(namee)
		sec='C'
	end
	@total+=1
	"You have been allotted section #{sec}" \
	"\nYour roll number is #{@deptname}#{sec}#{0}#{roll}" 
	end
	def sec_list
		s=[]
		s.push(@a,@b,@c)		
		s
	end

end

