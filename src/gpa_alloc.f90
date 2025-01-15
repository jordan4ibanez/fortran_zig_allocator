module gpa_alloc
   implicit none

   interface
      subroutine gpa_alloc_initialize() bind(c, name = "gpa_alloc_initialize")
      end subroutine gpa_alloc_initialize

      subroutine gpa_alloc_terminate() bind(c, name = "gpa_alloc_terminate")
      end subroutine gpa_alloc_terminate

      function gpa_alloc_alloc(size_of_type_in_bytes) result(raw_ptr) bind(c, name = "gpa_alloc_alloc")
         use, intrinsic :: iso_c_binding
         implicit none

         integer(c_int32_t), intent(in), value :: size_of_type_in_bytes
         type(c_ptr) :: raw_ptr
      end function gpa_alloc_alloc
   end interface

end module gpa_alloc
