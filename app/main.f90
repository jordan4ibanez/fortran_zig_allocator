program main
   use :: gpa_alloc
   implicit none

   !  call say_hello()

   call gpa_alloc_initialize()


   call gpa_alloc_terminate()
end program main
