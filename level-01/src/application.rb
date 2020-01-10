require_relative './department' # Include other files in the same directory

# Your application
class Application
   attr_accessor :departments

  def initialize
     self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].map { |dept| Department.new dept }

  end

  def enroll(student_name, student_department)

    dep = self.departments.detect { |dept| dept.deptname == student_department }
    if dep.total < 30
    "You have been enrolled to #{student_department}\n" \
    "#{dep.enroll student_name}"
     else
	"Error: Seats are not available in #{student_department}"
	end
	
  end

  def change_dept(student_name, student_department)
dep = self.departments.detect { |dept| dept.deptname == student_department }
    if dep.total < 30
	t=false
	self.departments.each do |dept| 
	dept.sec_list.each do |sec|
		n=sec.st_list.delete(student_name)
		if(n!=nil)
		sec.st_list.sort! {|a,b| a<=> b}
		t=true
		end
	break if t
end
	break if t
end
enroll(student_name, student_department)
else
"Seats are not available in #{student_department}" 
    end
  end

  def change_section(student_name, section)
   flag=false
   d=""
roll=""
	departments.each do |dep|
		#puts dep.deptname
		dep.sec_list.each do |sec|
			#puts sec.name
			sec.st_list.each do |stud|
				if stud==student_name 
					sec.st_list.delete(stud)
					sec.st_list.sort! {|a,b| a<=>b}
					flag=true
					d=dep
				end
				break if flag
			break if flag
			end
		break if flag
		end
	break if flag
	end	
	if !flag
		"Error: Seats are not available in #{section} section"
	else
			flag=false
			d.sec_list.each do |sec|
				if sec.name==section && sec.num!=10
					sec.st_list.push(student_name)
					sec.st_list.sort! {|a,b| a<=>b}
					roll=sec.st_list.index(student_name)+1
					flag=true
				end
			break if flag
			end
		"You have been allotted section #{section}\n" \
		"Your roll number is #{d.deptname}#{section}#{0}#{roll}" 
	end
  end

  def department_view(student_dept)
    dep = self.departments.detect { |dept| dept.deptname == student_dept }
str="List of students:"
	dep.sec_list.each do |sec|
		sec.st_list.each do |stud|
			str+="\n#{stud} - #{student_dept}#{sec.name}#{0}#{sec.st_list.index(stud)+1}"
		end
	end
str		
  end

  def section_view(student_dept, section)
      dep = self.departments.detect { |dept| dept.deptname == student_dept }
str="List of students:"
	dep.sec_list.each do |sec|
		if sec.name==section
			sec.st_list.each do |stud|
				str+="\n#{stud} - #{student_dept}#{sec.name}#{0}#{sec.st_list.index(stud)+1}"
			end
		end
	end
str		
  end

  def student_details(student_name)
flag=false
   	departments.each do |dep|
		dep.sec_list.each do |sec|
			sec.st_list.each do |stud|
				if stud==student_name
					return "#{stud} - #{dep.deptname} - Section #{sec.name} - #{dep.deptname}#{sec.name}#{0}#{sec.st_list.index(stud)+1}"
				end
			end
		end
	end

					
  end
end
