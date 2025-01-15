module gpa_alloc
   implicit none

   ! This is very raw, but could be made into a nice allocator.

   interface
      subroutine gpa_alloc_initialize() bind(c, name = "gpa_alloc_initialize")
      end subroutine gpa_alloc_initialize

      subroutine gpa_alloc_terminate() bind(c, name = "gpa_alloc_terminate")
      end subroutine gpa_alloc_terminate
   end interface

contains


end module gpa_alloc
