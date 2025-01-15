module fortran_zig
   implicit none
   private

   public :: say_hello

   interface
      subroutine testing() bind(c, name = "foof")

      end subroutine testing
   end interface

contains

   subroutine say_hello
      call testing()
   end subroutine say_hello

end module fortran_zig
