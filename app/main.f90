
program main
   use :: gpa_alloc
   use, intrinsic :: iso_c_binding
   implicit none

   integer :: i
   type(c_ptr) :: addr

   call gpa_alloc_initialize()

   addr = gpa_alloc_alloc(1)

   call gpa_alloc_terminate()

   do i = 1,1000
      print*,i
   end do
end program main
