# 1 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.cc"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 375 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.cc" 2
# 19 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.cc"
# 1 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.h" 1
# 21 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.h"
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 3





# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3





# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h" 1 3
# 278 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h" 3
namespace std
{
  typedef long unsigned int size_t;
  typedef long int ptrdiff_t;


  typedef decltype(nullptr) nullptr_t;

}
# 300 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h" 3
namespace std
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
namespace __gnu_cxx
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
# 586 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/os_defines.h" 1 3
# 39 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/os_defines.h" 3
# 1 "/usr/include/features.h" 1 3 4
# 392 "/usr/include/features.h" 3 4
# 1 "/usr/include/features-time64.h" 1 3 4
# 20 "/usr/include/features-time64.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 21 "/usr/include/features-time64.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 1 3 4
# 19 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 20 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 2 3 4
# 22 "/usr/include/features-time64.h" 2 3 4
# 393 "/usr/include/features.h" 2 3 4
# 464 "/usr/include/features.h" 3 4
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 465 "/usr/include/features.h" 2 3 4
# 486 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 559 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 560 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 561 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 487 "/usr/include/features.h" 2 3 4
# 510 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 511 "/usr/include/features.h" 2 3 4
# 40 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/os_defines.h" 2 3
# 587 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h" 2 3


# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/cpu_defines.h" 1 3
# 590 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h" 2 3
# 39 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename... _Elements>
    class tuple;

  template<typename _Tp>
    class reference_wrapper;
# 64 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp, _Tp __v>
    struct integral_constant
    {
      static constexpr _Tp value = __v;
      typedef _Tp value_type;
      typedef integral_constant<_Tp, __v> type;
      constexpr operator value_type() const noexcept { return value; }






    };

  template<typename _Tp, _Tp __v>
    constexpr _Tp integral_constant<_Tp, __v>::value;


  using true_type = integral_constant<bool, true>;


  using false_type = integral_constant<bool, false>;



  template<bool __v>
    using __bool_constant = integral_constant<bool, __v>;
# 104 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<bool, typename, typename>
    struct conditional;


  template <typename _Type>
    struct __type_identity
    { using type = _Type; };

  template<typename _Tp>
    using __type_identity_t = typename __type_identity<_Tp>::type;

  template<typename...>
    struct __or_;

  template<>
    struct __or_<>
    : public false_type
    { };

  template<typename _B1>
    struct __or_<_B1>
    : public _B1
    { };

  template<typename _B1, typename _B2>
    struct __or_<_B1, _B2>
    : public conditional<_B1::value, _B1, _B2>::type
    { };

  template<typename _B1, typename _B2, typename _B3, typename... _Bn>
    struct __or_<_B1, _B2, _B3, _Bn...>
    : public conditional<_B1::value, _B1, __or_<_B2, _B3, _Bn...>>::type
    { };

  template<typename...>
    struct __and_;

  template<>
    struct __and_<>
    : public true_type
    { };

  template<typename _B1>
    struct __and_<_B1>
    : public _B1
    { };

  template<typename _B1, typename _B2>
    struct __and_<_B1, _B2>
    : public conditional<_B1::value, _B2, _B1>::type
    { };

  template<typename _B1, typename _B2, typename _B3, typename... _Bn>
    struct __and_<_B1, _B2, _B3, _Bn...>
    : public conditional<_B1::value, __and_<_B2, _B3, _Bn...>, _B1>::type
    { };

  template<typename _Pp>
    struct __not_
    : public __bool_constant<!bool(_Pp::value)>
    { };
# 209 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename>
    struct is_reference;
  template<typename>
    struct is_function;
  template<typename>
    struct is_void;
  template<typename>
    struct remove_cv;
  template<typename>
    struct is_const;


  template<typename>
    struct __is_array_unknown_bounds;




  template <typename _Tp, size_t = sizeof(_Tp)>
    constexpr true_type __is_complete_or_unbounded(__type_identity<_Tp>)
    { return {}; }

  template <typename _TypeIdentity,
      typename _NestedType = typename _TypeIdentity::type>
    constexpr typename __or_<
      is_reference<_NestedType>,
      is_function<_NestedType>,
      is_void<_NestedType>,
      __is_array_unknown_bounds<_NestedType>
    >::type __is_complete_or_unbounded(_TypeIdentity)
    { return {}; }






  template<typename _Tp>
    struct __success_type
    { typedef _Tp type; };

  struct __failure_type
  { };


  template<typename _Tp>
    using __remove_cv_t = typename remove_cv<_Tp>::type;



  template<typename>
    struct __is_void_helper
    : public false_type { };

  template<>
    struct __is_void_helper<void>
    : public true_type { };



  template<typename _Tp>
    struct is_void
    : public __is_void_helper<__remove_cv_t<_Tp>>::type
    { };


  template<typename>
    struct __is_integral_helper
    : public false_type { };

  template<>
    struct __is_integral_helper<bool>
    : public true_type { };

  template<>
    struct __is_integral_helper<char>
    : public true_type { };

  template<>
    struct __is_integral_helper<signed char>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned char>
    : public true_type { };





  template<>
    struct __is_integral_helper<wchar_t>
    : public true_type { };
# 310 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<>
    struct __is_integral_helper<char16_t>
    : public true_type { };

  template<>
    struct __is_integral_helper<char32_t>
    : public true_type { };

  template<>
    struct __is_integral_helper<short>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned short>
    : public true_type { };

  template<>
    struct __is_integral_helper<int>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned int>
    : public true_type { };

  template<>
    struct __is_integral_helper<long>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned long>
    : public true_type { };

  template<>
    struct __is_integral_helper<long long>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned long long>
    : public true_type { };
# 391 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp>
    struct is_integral
    : public __is_integral_helper<__remove_cv_t<_Tp>>::type
    { };


  template<typename>
    struct __is_floating_point_helper
    : public false_type { };

  template<>
    struct __is_floating_point_helper<float>
    : public true_type { };

  template<>
    struct __is_floating_point_helper<double>
    : public true_type { };

  template<>
    struct __is_floating_point_helper<long double>
    : public true_type { };
# 421 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp>
    struct is_floating_point
    : public __is_floating_point_helper<__remove_cv_t<_Tp>>::type
    { };


  template<typename>
    struct is_array
    : public false_type { };

  template<typename _Tp, std::size_t _Size>
    struct is_array<_Tp[_Size]>
    : public true_type { };

  template<typename _Tp>
    struct is_array<_Tp[]>
    : public true_type { };

  template<typename>
    struct __is_pointer_helper
    : public false_type { };

  template<typename _Tp>
    struct __is_pointer_helper<_Tp*>
    : public true_type { };


  template<typename _Tp>
    struct is_pointer
    : public __is_pointer_helper<__remove_cv_t<_Tp>>::type
    { };


  template<typename>
    struct is_lvalue_reference
    : public false_type { };

  template<typename _Tp>
    struct is_lvalue_reference<_Tp&>
    : public true_type { };


  template<typename>
    struct is_rvalue_reference
    : public false_type { };

  template<typename _Tp>
    struct is_rvalue_reference<_Tp&&>
    : public true_type { };

  template<typename>
    struct __is_member_object_pointer_helper
    : public false_type { };

  template<typename _Tp, typename _Cp>
    struct __is_member_object_pointer_helper<_Tp _Cp::*>
    : public __not_<is_function<_Tp>>::type { };


  template<typename _Tp>
    struct is_member_object_pointer
    : public __is_member_object_pointer_helper<__remove_cv_t<_Tp>>::type
    { };

  template<typename>
    struct __is_member_function_pointer_helper
    : public false_type { };

  template<typename _Tp, typename _Cp>
    struct __is_member_function_pointer_helper<_Tp _Cp::*>
    : public is_function<_Tp>::type { };


  template<typename _Tp>
    struct is_member_function_pointer
    : public __is_member_function_pointer_helper<__remove_cv_t<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_enum
    : public integral_constant<bool, __is_enum(_Tp)>
    { };


  template<typename _Tp>
    struct is_union
    : public integral_constant<bool, __is_union(_Tp)>
    { };


  template<typename _Tp>
    struct is_class
    : public integral_constant<bool, __is_class(_Tp)>
    { };


  template<typename _Tp>
    struct is_function
    : public __bool_constant<!is_const<const _Tp>::value> { };

  template<typename _Tp>
    struct is_function<_Tp&>
    : public false_type { };

  template<typename _Tp>
    struct is_function<_Tp&&>
    : public false_type { };



  template<typename>
    struct __is_null_pointer_helper
    : public false_type { };

  template<>
    struct __is_null_pointer_helper<std::nullptr_t>
    : public true_type { };


  template<typename _Tp>
    struct is_null_pointer
    : public __is_null_pointer_helper<__remove_cv_t<_Tp>>::type
    { };



  template<typename _Tp>
    struct __is_nullptr_t
    : public is_null_pointer<_Tp>
    { } __attribute__ ((__deprecated__ ("use '" "std::is_null_pointer" "' instead")));




  template<typename _Tp>
    struct is_reference
    : public __or_<is_lvalue_reference<_Tp>,
                   is_rvalue_reference<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_arithmetic
    : public __or_<is_integral<_Tp>, is_floating_point<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_fundamental
    : public __or_<is_arithmetic<_Tp>, is_void<_Tp>,
     is_null_pointer<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_object
    : public __not_<__or_<is_function<_Tp>, is_reference<_Tp>,
                          is_void<_Tp>>>::type
    { };

  template<typename>
    struct is_member_pointer;


  template<typename _Tp>
    struct is_scalar
    : public __or_<is_arithmetic<_Tp>, is_enum<_Tp>, is_pointer<_Tp>,
                   is_member_pointer<_Tp>, is_null_pointer<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_compound
    : public __not_<is_fundamental<_Tp>>::type { };


  template<typename _Tp>
    struct __is_member_pointer_helper
    : public false_type { };

  template<typename _Tp, typename _Cp>
    struct __is_member_pointer_helper<_Tp _Cp::*>
    : public true_type { };



  template<typename _Tp>
    struct is_member_pointer
    : public __is_member_pointer_helper<__remove_cv_t<_Tp>>::type
    { };

  template<typename, typename>
    struct is_same;


  template<typename _Tp, typename... _Types>
    using __is_one_of = __or_<is_same<_Tp, _Types>...>;


  template<typename _Tp>
    using __is_signed_integer = __is_one_of<__remove_cv_t<_Tp>,
   signed char, signed short, signed int, signed long,
   signed long long
# 637 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
   >;


  template<typename _Tp>
    using __is_unsigned_integer = __is_one_of<__remove_cv_t<_Tp>,
   unsigned char, unsigned short, unsigned int, unsigned long,
   unsigned long long
# 656 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
   >;


  template<typename _Tp>
    using __is_standard_integer
      = __or_<__is_signed_integer<_Tp>, __is_unsigned_integer<_Tp>>;


  template<typename...> using __void_t = void;



  template<typename _Tp, typename = void>
    struct __is_referenceable
    : public false_type
    { };

  template<typename _Tp>
    struct __is_referenceable<_Tp, __void_t<_Tp&>>
    : public true_type
    { };





  template<typename>
    struct is_const
    : public false_type { };

  template<typename _Tp>
    struct is_const<_Tp const>
    : public true_type { };


  template<typename>
    struct is_volatile
    : public false_type { };

  template<typename _Tp>
    struct is_volatile<_Tp volatile>
    : public true_type { };


  template<typename _Tp>
    struct is_trivial
    : public integral_constant<bool, __is_trivial(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_copyable
    : public integral_constant<bool, __is_trivially_copyable(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_standard_layout
    : public integral_constant<bool, __is_standard_layout(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };





  template<typename _Tp>
    struct

    is_pod
    : public integral_constant<bool, __is_pod(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };




  template<typename _Tp>
    struct

    is_literal_type
    : public integral_constant<bool, __is_literal_type(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_empty
    : public integral_constant<bool, __is_empty(_Tp)>
    { };


  template<typename _Tp>
    struct is_polymorphic
    : public integral_constant<bool, __is_polymorphic(_Tp)>
    { };
# 776 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp>
    struct is_abstract
    : public integral_constant<bool, __is_abstract(_Tp)>
    { };


  template<typename _Tp,
    bool = is_arithmetic<_Tp>::value>
    struct __is_signed_helper
    : public false_type { };

  template<typename _Tp>
    struct __is_signed_helper<_Tp, true>
    : public integral_constant<bool, _Tp(-1) < _Tp(0)>
    { };



  template<typename _Tp>
    struct is_signed
    : public __is_signed_helper<_Tp>::type
    { };


  template<typename _Tp>
    struct is_unsigned
    : public __and_<is_arithmetic<_Tp>, __not_<is_signed<_Tp>>>
    { };


  template<typename _Tp, typename _Up = _Tp&&>
    _Up
    __declval(int);

  template<typename _Tp>
    _Tp
    __declval(long);


  template<typename _Tp>
    auto declval() noexcept -> decltype(__declval<_Tp>(0));

  template<typename, unsigned = 0>
    struct extent;

  template<typename>
    struct remove_all_extents;


  template<typename _Tp>
    struct __is_array_known_bounds
    : public integral_constant<bool, (extent<_Tp>::value > 0)>
    { };

  template<typename _Tp>
    struct __is_array_unknown_bounds
    : public __and_<is_array<_Tp>, __not_<extent<_Tp>>>
    { };
# 842 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  struct __do_is_destructible_impl
  {
    template<typename _Tp, typename = decltype(declval<_Tp&>().~_Tp())>
      static true_type __test(int);

    template<typename>
      static false_type __test(...);
  };

  template<typename _Tp>
    struct __is_destructible_impl
    : public __do_is_destructible_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };

  template<typename _Tp,
           bool = __or_<is_void<_Tp>,
                        __is_array_unknown_bounds<_Tp>,
                        is_function<_Tp>>::value,
           bool = __or_<is_reference<_Tp>, is_scalar<_Tp>>::value>
    struct __is_destructible_safe;

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, false, false>
    : public __is_destructible_impl<typename
               remove_all_extents<_Tp>::type>::type
    { };

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, true, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, false, true>
    : public true_type { };



  template<typename _Tp>
    struct is_destructible
    : public __is_destructible_safe<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };







  struct __do_is_nt_destructible_impl
  {
    template<typename _Tp>
      static __bool_constant<noexcept(declval<_Tp&>().~_Tp())>
      __test(int);

    template<typename>
      static false_type __test(...);
  };

  template<typename _Tp>
    struct __is_nt_destructible_impl
    : public __do_is_nt_destructible_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };

  template<typename _Tp,
           bool = __or_<is_void<_Tp>,
                        __is_array_unknown_bounds<_Tp>,
                        is_function<_Tp>>::value,
           bool = __or_<is_reference<_Tp>, is_scalar<_Tp>>::value>
    struct __is_nt_destructible_safe;

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, false, false>
    : public __is_nt_destructible_impl<typename
               remove_all_extents<_Tp>::type>::type
    { };

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, true, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, false, true>
    : public true_type { };



  template<typename _Tp>
    struct is_nothrow_destructible
    : public __is_nt_destructible_safe<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename... _Args>
    struct __is_constructible_impl
    : public __bool_constant<__is_constructible(_Tp, _Args...)>
    { };



  template<typename _Tp, typename... _Args>
    struct is_constructible
      : public __is_constructible_impl<_Tp, _Args...>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_default_constructible
    : public __is_constructible_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_copy_constructible_impl;

  template<typename _Tp>
    struct __is_copy_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_copy_constructible_impl<_Tp, true>
    : public __is_constructible_impl<_Tp, const _Tp&>
    { };



  template<typename _Tp>
    struct is_copy_constructible
    : public __is_copy_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_move_constructible_impl;

  template<typename _Tp>
    struct __is_move_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_move_constructible_impl<_Tp, true>
    : public __is_constructible_impl<_Tp, _Tp&&>
    { };



  template<typename _Tp>
    struct is_move_constructible
    : public __is_move_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename... _Args>
    using __is_nothrow_constructible_impl
      = __bool_constant<__is_nothrow_constructible(_Tp, _Args...)>;



  template<typename _Tp, typename... _Args>
    struct is_nothrow_constructible
    : public __is_nothrow_constructible_impl<_Tp, _Args...>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_nothrow_default_constructible
    : public __bool_constant<__is_nothrow_constructible(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nothrow_copy_constructible_impl;

  template<typename _Tp>
    struct __is_nothrow_copy_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nothrow_copy_constructible_impl<_Tp, true>
    : public __is_nothrow_constructible_impl<_Tp, const _Tp&>
    { };



  template<typename _Tp>
    struct is_nothrow_copy_constructible
    : public __is_nothrow_copy_constructible_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nothrow_move_constructible_impl;

  template<typename _Tp>
    struct __is_nothrow_move_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nothrow_move_constructible_impl<_Tp, true>
    : public __is_nothrow_constructible_impl<_Tp, _Tp&&>
    { };



  template<typename _Tp>
    struct is_nothrow_move_constructible
    : public __is_nothrow_move_constructible_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename _Up>
    struct is_assignable
    : public __bool_constant<__is_assignable(_Tp, _Up)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_copy_assignable_impl;

  template<typename _Tp>
    struct __is_copy_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_copy_assignable_impl<_Tp, true>
    : public __bool_constant<__is_assignable(_Tp&, const _Tp&)>
    { };


  template<typename _Tp>
    struct is_copy_assignable
    : public __is_copy_assignable_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_move_assignable_impl;

  template<typename _Tp>
    struct __is_move_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_move_assignable_impl<_Tp, true>
    : public __bool_constant<__is_assignable(_Tp&, _Tp&&)>
    { };


  template<typename _Tp>
    struct is_move_assignable
    : public __is_move_assignable_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  template<typename _Tp, typename _Up>
    using __is_nothrow_assignable_impl
      = __bool_constant<__is_nothrow_assignable(_Tp, _Up)>;


  template<typename _Tp, typename _Up>
    struct is_nothrow_assignable
    : public __is_nothrow_assignable_impl<_Tp, _Up>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nt_copy_assignable_impl;

  template<typename _Tp>
    struct __is_nt_copy_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nt_copy_assignable_impl<_Tp, true>
    : public __is_nothrow_assignable_impl<_Tp&, const _Tp&>
    { };


  template<typename _Tp>
    struct is_nothrow_copy_assignable
    : public __is_nt_copy_assignable_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nt_move_assignable_impl;

  template<typename _Tp>
    struct __is_nt_move_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nt_move_assignable_impl<_Tp, true>
    : public __is_nothrow_assignable_impl<_Tp&, _Tp&&>
    { };


  template<typename _Tp>
    struct is_nothrow_move_assignable
    : public __is_nt_move_assignable_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename... _Args>
    struct is_trivially_constructible
    : public __bool_constant<__is_trivially_constructible(_Tp, _Args...)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_default_constructible
    : public __bool_constant<__is_trivially_constructible(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  struct __do_is_implicitly_default_constructible_impl
  {
    template <typename _Tp>
    static void __helper(const _Tp&);

    template <typename _Tp>
    static true_type __test(const _Tp&,
                            decltype(__helper<const _Tp&>({}))* = 0);

    static false_type __test(...);
  };

  template<typename _Tp>
    struct __is_implicitly_default_constructible_impl
    : public __do_is_implicitly_default_constructible_impl
    {
      typedef decltype(__test(declval<_Tp>())) type;
    };

  template<typename _Tp>
    struct __is_implicitly_default_constructible_safe
    : public __is_implicitly_default_constructible_impl<_Tp>::type
    { };

  template <typename _Tp>
    struct __is_implicitly_default_constructible
    : public __and_<__is_constructible_impl<_Tp>,
      __is_implicitly_default_constructible_safe<_Tp>>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_copy_constructible_impl;

  template<typename _Tp>
    struct __is_trivially_copy_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_trivially_copy_constructible_impl<_Tp, true>
    : public __and_<__is_copy_constructible_impl<_Tp>,
      integral_constant<bool,
   __is_trivially_constructible(_Tp, const _Tp&)>>
    { };


  template<typename _Tp>
    struct is_trivially_copy_constructible
    : public __is_trivially_copy_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_move_constructible_impl;

  template<typename _Tp>
    struct __is_trivially_move_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_trivially_move_constructible_impl<_Tp, true>
    : public __and_<__is_move_constructible_impl<_Tp>,
      integral_constant<bool,
   __is_trivially_constructible(_Tp, _Tp&&)>>
    { };


  template<typename _Tp>
    struct is_trivially_move_constructible
    : public __is_trivially_move_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename _Up>
    struct is_trivially_assignable
    : public __bool_constant<__is_trivially_assignable(_Tp, _Up)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_copy_assignable_impl;

  template<typename _Tp>
    struct __is_trivially_copy_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_trivially_copy_assignable_impl<_Tp, true>
    : public __bool_constant<__is_trivially_assignable(_Tp&, const _Tp&)>
    { };


  template<typename _Tp>
    struct is_trivially_copy_assignable
    : public __is_trivially_copy_assignable_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_move_assignable_impl;

  template<typename _Tp>
    struct __is_trivially_move_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_trivially_move_assignable_impl<_Tp, true>
    : public __bool_constant<__is_trivially_assignable(_Tp&, _Tp&&)>
    { };


  template<typename _Tp>
    struct is_trivially_move_assignable
    : public __is_trivially_move_assignable_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_destructible
    : public __and_<__is_destructible_safe<_Tp>,
      __bool_constant<__has_trivial_destructor(_Tp)>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };



  template<typename _Tp>
    struct has_virtual_destructor
    : public integral_constant<bool, __has_virtual_destructor(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };





  template<typename _Tp>
    struct alignment_of
    : public integral_constant<std::size_t, alignof(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename>
    struct rank
    : public integral_constant<std::size_t, 0> { };

  template<typename _Tp, std::size_t _Size>
    struct rank<_Tp[_Size]>
    : public integral_constant<std::size_t, 1 + rank<_Tp>::value> { };

  template<typename _Tp>
    struct rank<_Tp[]>
    : public integral_constant<std::size_t, 1 + rank<_Tp>::value> { };


  template<typename, unsigned _Uint>
    struct extent
    : public integral_constant<std::size_t, 0> { };

  template<typename _Tp, unsigned _Uint, std::size_t _Size>
    struct extent<_Tp[_Size], _Uint>
    : public integral_constant<std::size_t,
          _Uint == 0 ? _Size : extent<_Tp,
          _Uint - 1>::value>
    { };

  template<typename _Tp, unsigned _Uint>
    struct extent<_Tp[], _Uint>
    : public integral_constant<std::size_t,
          _Uint == 0 ? 0 : extent<_Tp,
             _Uint - 1>::value>
    { };





  template<typename _Tp, typename _Up>
    struct is_same

    : public integral_constant<bool, __is_same(_Tp, _Up)>



    { };
# 1420 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Base, typename _Derived>
    struct is_base_of
    : public integral_constant<bool, __is_base_of(_Base, _Derived)>
    { };

  template<typename _From, typename _To,
           bool = __or_<is_void<_From>, is_function<_To>,
                        is_array<_To>>::value>
    struct __is_convertible_helper
    {
      typedef typename is_void<_To>::type type;
    };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
 template<typename _From, typename _To>
    class __is_convertible_helper<_From, _To, false>
    {
      template<typename _To1>
 static void __test_aux(_To1) noexcept;

      template<typename _From1, typename _To1,
        typename = decltype(__test_aux<_To1>(std::declval<_From1>()))>
 static true_type
 __test(int);

      template<typename, typename>
 static false_type
 __test(...);

    public:
      typedef decltype(__test<_From, _To>(0)) type;
    };
#pragma GCC diagnostic pop


 template<typename _From, typename _To>
    struct is_convertible
    : public __is_convertible_helper<_From, _To>::type
    { };


  template<typename _ToElementType, typename _FromElementType>
    using __is_array_convertible
      = is_convertible<_FromElementType(*)[], _ToElementType(*)[]>;

  template<typename _From, typename _To,
           bool = __or_<is_void<_From>, is_function<_To>,
                        is_array<_To>>::value>
    struct __is_nt_convertible_helper
    : is_void<_To>
    { };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
 template<typename _From, typename _To>
    class __is_nt_convertible_helper<_From, _To, false>
    {
      template<typename _To1>
 static void __test_aux(_To1) noexcept;

      template<typename _From1, typename _To1>
 static
 __bool_constant<noexcept(__test_aux<_To1>(std::declval<_From1>()))>
 __test(int);

      template<typename, typename>
 static false_type
 __test(...);

    public:
      using type = decltype(__test<_From, _To>(0));
    };
#pragma GCC diagnostic pop
# 1512 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
 template<typename _Tp>
    struct remove_const
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_const<_Tp const>
    { typedef _Tp type; };


  template<typename _Tp>
    struct remove_volatile
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_volatile<_Tp volatile>
    { typedef _Tp type; };


  template<typename _Tp>
    struct remove_cv
    { using type = _Tp; };

  template<typename _Tp>
    struct remove_cv<const _Tp>
    { using type = _Tp; };

  template<typename _Tp>
    struct remove_cv<volatile _Tp>
    { using type = _Tp; };

  template<typename _Tp>
    struct remove_cv<const volatile _Tp>
    { using type = _Tp; };


  template<typename _Tp>
    struct add_const
    { typedef _Tp const type; };


  template<typename _Tp>
    struct add_volatile
    { typedef _Tp volatile type; };


  template<typename _Tp>
    struct add_cv
    {
      typedef typename
      add_const<typename add_volatile<_Tp>::type>::type type;
    };
# 1596 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp>
    struct remove_reference
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_reference<_Tp&>
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_reference<_Tp&&>
    { typedef _Tp type; };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __add_lvalue_reference_helper
    { typedef _Tp type; };

  template<typename _Tp>
    struct __add_lvalue_reference_helper<_Tp, true>
    { typedef _Tp& type; };


  template<typename _Tp>
    struct add_lvalue_reference
    : public __add_lvalue_reference_helper<_Tp>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __add_rvalue_reference_helper
    { typedef _Tp type; };

  template<typename _Tp>
    struct __add_rvalue_reference_helper<_Tp, true>
    { typedef _Tp&& type; };


  template<typename _Tp>
    struct add_rvalue_reference
    : public __add_rvalue_reference_helper<_Tp>
    { };
# 1655 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Unqualified, bool _IsConst, bool _IsVol>
    struct __cv_selector;

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, false, false>
    { typedef _Unqualified __type; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, false, true>
    { typedef volatile _Unqualified __type; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, true, false>
    { typedef const _Unqualified __type; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, true, true>
    { typedef const volatile _Unqualified __type; };

  template<typename _Qualified, typename _Unqualified,
    bool _IsConst = is_const<_Qualified>::value,
    bool _IsVol = is_volatile<_Qualified>::value>
    class __match_cv_qualifiers
    {
      typedef __cv_selector<_Unqualified, _IsConst, _IsVol> __match;

    public:
      typedef typename __match::__type __type;
    };


  template<typename _Tp>
    struct __make_unsigned
    { typedef _Tp __type; };

  template<>
    struct __make_unsigned<char>
    { typedef unsigned char __type; };

  template<>
    struct __make_unsigned<signed char>
    { typedef unsigned char __type; };

  template<>
    struct __make_unsigned<short>
    { typedef unsigned short __type; };

  template<>
    struct __make_unsigned<int>
    { typedef unsigned int __type; };

  template<>
    struct __make_unsigned<long>
    { typedef unsigned long __type; };

  template<>
    struct __make_unsigned<long long>
    { typedef unsigned long long __type; };
# 1736 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp,
    bool _IsInt = is_integral<_Tp>::value,
    bool _IsEnum = is_enum<_Tp>::value>
    class __make_unsigned_selector;

  template<typename _Tp>
    class __make_unsigned_selector<_Tp, true, false>
    {
      using __unsigned_type
 = typename __make_unsigned<__remove_cv_t<_Tp>>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __unsigned_type>::__type;
    };

  class __make_unsigned_selector_base
  {
  protected:
    template<typename...> struct _List { };

    template<typename _Tp, typename... _Up>
      struct _List<_Tp, _Up...> : _List<_Up...>
      { static constexpr size_t __size = sizeof(_Tp); };

    template<size_t _Sz, typename _Tp, bool = (_Sz <= _Tp::__size)>
      struct __select;

    template<size_t _Sz, typename _Uint, typename... _UInts>
      struct __select<_Sz, _List<_Uint, _UInts...>, true>
      { using __type = _Uint; };

    template<size_t _Sz, typename _Uint, typename... _UInts>
      struct __select<_Sz, _List<_Uint, _UInts...>, false>
      : __select<_Sz, _List<_UInts...>>
      { };
  };


  template<typename _Tp>
    class __make_unsigned_selector<_Tp, false, true>
    : __make_unsigned_selector_base
    {

      using _UInts = _List<unsigned char, unsigned short, unsigned int,
      unsigned long, unsigned long long>;

      using __unsigned_type = typename __select<sizeof(_Tp), _UInts>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __unsigned_type>::__type;
    };






  template<>
    struct __make_unsigned<wchar_t>
    {
      using __type
 = typename __make_unsigned_selector<wchar_t, false, true>::__type;
    };
# 1812 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<>
    struct __make_unsigned<char16_t>
    {
      using __type
 = typename __make_unsigned_selector<char16_t, false, true>::__type;
    };

  template<>
    struct __make_unsigned<char32_t>
    {
      using __type
 = typename __make_unsigned_selector<char32_t, false, true>::__type;
    };






  template<typename _Tp>
    struct make_unsigned
    { typedef typename __make_unsigned_selector<_Tp>::__type type; };


  template<>
    struct make_unsigned<bool>;




  template<typename _Tp>
    struct __make_signed
    { typedef _Tp __type; };

  template<>
    struct __make_signed<char>
    { typedef signed char __type; };

  template<>
    struct __make_signed<unsigned char>
    { typedef signed char __type; };

  template<>
    struct __make_signed<unsigned short>
    { typedef signed short __type; };

  template<>
    struct __make_signed<unsigned int>
    { typedef signed int __type; };

  template<>
    struct __make_signed<unsigned long>
    { typedef signed long __type; };

  template<>
    struct __make_signed<unsigned long long>
    { typedef signed long long __type; };
# 1892 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp,
    bool _IsInt = is_integral<_Tp>::value,
    bool _IsEnum = is_enum<_Tp>::value>
    class __make_signed_selector;

  template<typename _Tp>
    class __make_signed_selector<_Tp, true, false>
    {
      using __signed_type
 = typename __make_signed<__remove_cv_t<_Tp>>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __signed_type>::__type;
    };


  template<typename _Tp>
    class __make_signed_selector<_Tp, false, true>
    {
      typedef typename __make_unsigned_selector<_Tp>::__type __unsigned_type;

    public:
      typedef typename __make_signed_selector<__unsigned_type>::__type __type;
    };






  template<>
    struct __make_signed<wchar_t>
    {
      using __type
 = typename __make_signed_selector<wchar_t, false, true>::__type;
    };
# 1940 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<>
    struct __make_signed<char16_t>
    {
      using __type
 = typename __make_signed_selector<char16_t, false, true>::__type;
    };

  template<>
    struct __make_signed<char32_t>
    {
      using __type
 = typename __make_signed_selector<char32_t, false, true>::__type;
    };






  template<typename _Tp>
    struct make_signed
    { typedef typename __make_signed_selector<_Tp>::__type type; };


  template<>
    struct make_signed<bool>;
# 1980 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp>
    struct remove_extent
    { typedef _Tp type; };

  template<typename _Tp, std::size_t _Size>
    struct remove_extent<_Tp[_Size]>
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_extent<_Tp[]>
    { typedef _Tp type; };


  template<typename _Tp>
    struct remove_all_extents
    { typedef _Tp type; };

  template<typename _Tp, std::size_t _Size>
    struct remove_all_extents<_Tp[_Size]>
    { typedef typename remove_all_extents<_Tp>::type type; };

  template<typename _Tp>
    struct remove_all_extents<_Tp[]>
    { typedef typename remove_all_extents<_Tp>::type type; };
# 2017 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Tp, typename>
    struct __remove_pointer_helper
    { typedef _Tp type; };

  template<typename _Tp, typename _Up>
    struct __remove_pointer_helper<_Tp, _Up*>
    { typedef _Up type; };


  template<typename _Tp>
    struct remove_pointer
    : public __remove_pointer_helper<_Tp, __remove_cv_t<_Tp>>
    { };

  template<typename _Tp, bool = __or_<__is_referenceable<_Tp>,
          is_void<_Tp>>::value>
    struct __add_pointer_helper
    { typedef _Tp type; };

  template<typename _Tp>
    struct __add_pointer_helper<_Tp, true>
    { typedef typename remove_reference<_Tp>::type* type; };


  template<typename _Tp>
    struct add_pointer
    : public __add_pointer_helper<_Tp>
    { };
# 2056 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<std::size_t _Len>
    struct __aligned_storage_msa
    {
      union __type
      {
 unsigned char __data[_Len];
 struct __attribute__((__aligned__)) { } __align;
      };
    };
# 2076 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<std::size_t _Len, std::size_t _Align =
    __alignof__(typename __aligned_storage_msa<_Len>::__type)>
    struct aligned_storage
    {
      union type
      {
 unsigned char __data[_Len];
 struct __attribute__((__aligned__((_Align)))) { } __align;
      };
    };

  template <typename... _Types>
    struct __strictest_alignment
    {
      static const size_t _S_alignment = 0;
      static const size_t _S_size = 0;
    };

  template <typename _Tp, typename... _Types>
    struct __strictest_alignment<_Tp, _Types...>
    {
      static const size_t _S_alignment =
        alignof(_Tp) > __strictest_alignment<_Types...>::_S_alignment
 ? alignof(_Tp) : __strictest_alignment<_Types...>::_S_alignment;
      static const size_t _S_size =
        sizeof(_Tp) > __strictest_alignment<_Types...>::_S_size
 ? sizeof(_Tp) : __strictest_alignment<_Types...>::_S_size;
    };
# 2115 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template <size_t _Len, typename... _Types>
    struct aligned_union
    {
    private:
      static_assert(sizeof...(_Types) != 0, "At least one type is required");

      using __strictest = __strictest_alignment<_Types...>;
      static const size_t _S_len = _Len > __strictest::_S_size
 ? _Len : __strictest::_S_size;
    public:

      static const size_t alignment_value = __strictest::_S_alignment;

      typedef typename aligned_storage<_S_len, alignment_value>::type type;
    };

  template <size_t _Len, typename... _Types>
    const size_t aligned_union<_Len, _Types...>::alignment_value;





  template<typename _Up,
    bool _IsArray = is_array<_Up>::value,
    bool _IsFunction = is_function<_Up>::value>
    struct __decay_selector;


  template<typename _Up>
    struct __decay_selector<_Up, false, false>
    { typedef __remove_cv_t<_Up> __type; };

  template<typename _Up>
    struct __decay_selector<_Up, true, false>
    { typedef typename remove_extent<_Up>::type* __type; };

  template<typename _Up>
    struct __decay_selector<_Up, false, true>
    { typedef typename add_pointer<_Up>::type __type; };



  template<typename _Tp>
    class decay
    {
      typedef typename remove_reference<_Tp>::type __remove_type;

    public:
      typedef typename __decay_selector<__remove_type>::__type type;
    };




  template<typename _Tp>
    struct __strip_reference_wrapper
    {
      typedef _Tp __type;
    };

  template<typename _Tp>
    struct __strip_reference_wrapper<reference_wrapper<_Tp> >
    {
      typedef _Tp& __type;
    };


  template<typename _Tp>
    using __decay_t = typename decay<_Tp>::type;

  template<typename _Tp>
    using __decay_and_strip = __strip_reference_wrapper<__decay_t<_Tp>>;




  template<bool, typename _Tp = void>
    struct enable_if
    { };


  template<typename _Tp>
    struct enable_if<true, _Tp>
    { typedef _Tp type; };




  template<bool _Cond, typename _Tp = void>
    using __enable_if_t = typename enable_if<_Cond, _Tp>::type;


  template<typename... _Cond>
    using _Require = __enable_if_t<__and_<_Cond...>::value>;


  template<typename _Tp>
    using __remove_cvref_t
     = typename remove_cv<typename remove_reference<_Tp>::type>::type;




  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct conditional
    { typedef _Iftrue type; };


  template<typename _Iftrue, typename _Iffalse>
    struct conditional<false, _Iftrue, _Iffalse>
    { typedef _Iffalse type; };


  template<typename... _Tp>
    struct common_type;




  struct __do_common_type_impl
  {
    template<typename _Tp, typename _Up>
      using __cond_t
 = decltype(true ? std::declval<_Tp>() : std::declval<_Up>());



    template<typename _Tp, typename _Up>
      static __success_type<__decay_t<__cond_t<_Tp, _Up>>>
      _S_test(int);
# 2255 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
    template<typename, typename>
      static __failure_type
      _S_test_2(...);

    template<typename _Tp, typename _Up>
      static decltype(_S_test_2<_Tp, _Up>(0))
      _S_test(...);
  };


  template<>
    struct common_type<>
    { };


  template<typename _Tp0>
    struct common_type<_Tp0>
    : public common_type<_Tp0, _Tp0>
    { };


  template<typename _Tp1, typename _Tp2,
    typename _Dp1 = __decay_t<_Tp1>, typename _Dp2 = __decay_t<_Tp2>>
    struct __common_type_impl
    {


      using type = common_type<_Dp1, _Dp2>;
    };

  template<typename _Tp1, typename _Tp2>
    struct __common_type_impl<_Tp1, _Tp2, _Tp1, _Tp2>
    : private __do_common_type_impl
    {


      using type = decltype(_S_test<_Tp1, _Tp2>(0));
    };


  template<typename _Tp1, typename _Tp2>
    struct common_type<_Tp1, _Tp2>
    : public __common_type_impl<_Tp1, _Tp2>::type
    { };

  template<typename...>
    struct __common_type_pack
    { };

  template<typename, typename, typename = void>
    struct __common_type_fold;


  template<typename _Tp1, typename _Tp2, typename... _Rp>
    struct common_type<_Tp1, _Tp2, _Rp...>
    : public __common_type_fold<common_type<_Tp1, _Tp2>,
    __common_type_pack<_Rp...>>
    { };




  template<typename _CTp, typename... _Rp>
    struct __common_type_fold<_CTp, __common_type_pack<_Rp...>,
         __void_t<typename _CTp::type>>
    : public common_type<typename _CTp::type, _Rp...>
    { };


  template<typename _CTp, typename _Rp>
    struct __common_type_fold<_CTp, _Rp, void>
    { };

  template<typename _Tp, bool = is_enum<_Tp>::value>
    struct __underlying_type_impl
    {
      using type = __underlying_type(_Tp);
    };

  template<typename _Tp>
    struct __underlying_type_impl<_Tp, false>
    { };



  template<typename _Tp>
    struct underlying_type
    : public __underlying_type_impl<_Tp>
    { };


  template<typename _Tp>
    struct __declval_protector
    {
      static const bool __stop = false;
    };






  template<typename _Tp>
    auto declval() noexcept -> decltype(__declval<_Tp>(0))
    {
      static_assert(__declval_protector<_Tp>::__stop,
      "declval() must not be used!");
      return __declval<_Tp>(0);
    }


  template<typename _Signature>
    struct result_of;






  struct __invoke_memfun_ref { };
  struct __invoke_memfun_deref { };
  struct __invoke_memobj_ref { };
  struct __invoke_memobj_deref { };
  struct __invoke_other { };


  template<typename _Tp, typename _Tag>
    struct __result_of_success : __success_type<_Tp>
    { using __invoke_type = _Tag; };


  struct __result_of_memfun_ref_impl
  {
    template<typename _Fp, typename _Tp1, typename... _Args>
      static __result_of_success<decltype(
      (std::declval<_Tp1>().*std::declval<_Fp>())(std::declval<_Args>()...)
      ), __invoke_memfun_ref> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun_ref
    : private __result_of_memfun_ref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg, _Args...>(0)) type;
    };


  struct __result_of_memfun_deref_impl
  {
    template<typename _Fp, typename _Tp1, typename... _Args>
      static __result_of_success<decltype(
      ((*std::declval<_Tp1>()).*std::declval<_Fp>())(std::declval<_Args>()...)
      ), __invoke_memfun_deref> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun_deref
    : private __result_of_memfun_deref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg, _Args...>(0)) type;
    };


  struct __result_of_memobj_ref_impl
  {
    template<typename _Fp, typename _Tp1>
      static __result_of_success<decltype(
      std::declval<_Tp1>().*std::declval<_Fp>()
      ), __invoke_memobj_ref> _S_test(int);

    template<typename, typename>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj_ref
    : private __result_of_memobj_ref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg>(0)) type;
    };


  struct __result_of_memobj_deref_impl
  {
    template<typename _Fp, typename _Tp1>
      static __result_of_success<decltype(
      (*std::declval<_Tp1>()).*std::declval<_Fp>()
      ), __invoke_memobj_deref> _S_test(int);

    template<typename, typename>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj_deref
    : private __result_of_memobj_deref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg>(0)) type;
    };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj;

  template<typename _Res, typename _Class, typename _Arg>
    struct __result_of_memobj<_Res _Class::*, _Arg>
    {
      typedef __remove_cvref_t<_Arg> _Argval;
      typedef _Res _Class::* _MemPtr;
      typedef typename conditional<__or_<is_same<_Argval, _Class>,
        is_base_of<_Class, _Argval>>::value,
        __result_of_memobj_ref<_MemPtr, _Arg>,
        __result_of_memobj_deref<_MemPtr, _Arg>
      >::type::type type;
    };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun;

  template<typename _Res, typename _Class, typename _Arg, typename... _Args>
    struct __result_of_memfun<_Res _Class::*, _Arg, _Args...>
    {
      typedef typename remove_reference<_Arg>::type _Argval;
      typedef _Res _Class::* _MemPtr;
      typedef typename conditional<is_base_of<_Class, _Argval>::value,
        __result_of_memfun_ref<_MemPtr, _Arg, _Args...>,
        __result_of_memfun_deref<_MemPtr, _Arg, _Args...>
      >::type::type type;
    };






  template<typename _Tp, typename _Up = __remove_cvref_t<_Tp>>
    struct __inv_unwrap
    {
      using type = _Tp;
    };

  template<typename _Tp, typename _Up>
    struct __inv_unwrap<_Tp, reference_wrapper<_Up>>
    {
      using type = _Up&;
    };

  template<bool, bool, typename _Functor, typename... _ArgTypes>
    struct __result_of_impl
    {
      typedef __failure_type type;
    };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_impl<true, false, _MemPtr, _Arg>
    : public __result_of_memobj<__decay_t<_MemPtr>,
    typename __inv_unwrap<_Arg>::type>
    { };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_impl<false, true, _MemPtr, _Arg, _Args...>
    : public __result_of_memfun<__decay_t<_MemPtr>,
    typename __inv_unwrap<_Arg>::type, _Args...>
    { };


  struct __result_of_other_impl
  {
    template<typename _Fn, typename... _Args>
      static __result_of_success<decltype(
      std::declval<_Fn>()(std::declval<_Args>()...)
      ), __invoke_other> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _Functor, typename... _ArgTypes>
    struct __result_of_impl<false, false, _Functor, _ArgTypes...>
    : private __result_of_other_impl
    {
      typedef decltype(_S_test<_Functor, _ArgTypes...>(0)) type;
    };


  template<typename _Functor, typename... _ArgTypes>
    struct __invoke_result
    : public __result_of_impl<
        is_member_object_pointer<
          typename remove_reference<_Functor>::type
        >::value,
        is_member_function_pointer<
          typename remove_reference<_Functor>::type
        >::value,
 _Functor, _ArgTypes...
      >::type
    { };


  template<typename _Functor, typename... _ArgTypes>
    struct result_of<_Functor(_ArgTypes...)>
    : public __invoke_result<_Functor, _ArgTypes...>
    { };
# 2607 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Default, typename _AlwaysVoid,
    template<typename...> class _Op, typename... _Args>
    struct __detector
    {
      using value_t = false_type;
      using type = _Default;
    };


  template<typename _Default, template<typename...> class _Op,
     typename... _Args>
    struct __detector<_Default, __void_t<_Op<_Args...>>, _Op, _Args...>
    {
      using value_t = true_type;
      using type = _Op<_Args...>;
    };


  template<typename _Default, template<typename...> class _Op,
    typename... _Args>
    using __detected_or = __detector<_Default, void, _Op, _Args...>;


  template<typename _Default, template<typename...> class _Op,
    typename... _Args>
    using __detected_or_t
      = typename __detected_or<_Default, _Op, _Args...>::type;
# 2649 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template <typename _Tp>
    struct __is_swappable;

  template <typename _Tp>
    struct __is_nothrow_swappable;

  template<typename>
    struct __is_tuple_like_impl : false_type
    { };

  template<typename... _Tps>
    struct __is_tuple_like_impl<tuple<_Tps...>> : true_type
    { };


  template<typename _Tp>
    struct __is_tuple_like
    : public __is_tuple_like_impl<__remove_cvref_t<_Tp>>::type
    { };


  template<typename _Tp>

    inline
    _Require<__not_<__is_tuple_like<_Tp>>,
      is_move_constructible<_Tp>,
      is_move_assignable<_Tp>>
    swap(_Tp&, _Tp&)
    noexcept(__and_<is_nothrow_move_constructible<_Tp>,
             is_nothrow_move_assignable<_Tp>>::value);

  template<typename _Tp, size_t _Nm>

    inline
    __enable_if_t<__is_swappable<_Tp>::value>
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])
    noexcept(__is_nothrow_swappable<_Tp>::value);


  namespace __swappable_details {
    using std::swap;

    struct __do_is_swappable_impl
    {
      template<typename _Tp, typename
               = decltype(swap(std::declval<_Tp&>(), std::declval<_Tp&>()))>
        static true_type __test(int);

      template<typename>
        static false_type __test(...);
    };

    struct __do_is_nothrow_swappable_impl
    {
      template<typename _Tp>
        static __bool_constant<
          noexcept(swap(std::declval<_Tp&>(), std::declval<_Tp&>()))
        > __test(int);

      template<typename>
        static false_type __test(...);
    };

  }

  template<typename _Tp>
    struct __is_swappable_impl
    : public __swappable_details::__do_is_swappable_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };

  template<typename _Tp>
    struct __is_nothrow_swappable_impl
    : public __swappable_details::__do_is_nothrow_swappable_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };

  template<typename _Tp>
    struct __is_swappable
    : public __is_swappable_impl<_Tp>::type
    { };

  template<typename _Tp>
    struct __is_nothrow_swappable
    : public __is_nothrow_swappable_impl<_Tp>::type
    { };
# 2876 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
  template<typename _Result, typename _Ret,
    bool = is_void<_Ret>::value, typename = void>
    struct __is_invocable_impl
    : false_type
    {
      using __nothrow_type = false_type;
    };


  template<typename _Result, typename _Ret>
    struct __is_invocable_impl<_Result, _Ret,
                                true,
          __void_t<typename _Result::type>>
    : true_type
    {
      using __nothrow_type = true_type;
    };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"

 template<typename _Result, typename _Ret>
    struct __is_invocable_impl<_Result, _Ret,
                                false,
          __void_t<typename _Result::type>>
    {
    private:



      static typename _Result::type _S_get() noexcept;

      template<typename _Tp>
 static void _S_conv(_Tp) noexcept;


      template<typename _Tp, bool _Check_Noex = false,
        typename = decltype(_S_conv<_Tp>(_S_get())),
        bool _Noex = noexcept(_S_conv<_Tp>(_S_get()))>
 static __bool_constant<_Check_Noex ? _Noex : true>
 _S_test(int);

      template<typename _Tp, bool = false>
 static false_type
 _S_test(...);

    public:

      using type = decltype(_S_test<_Ret>(1));


      using __nothrow_type = decltype(_S_test<_Ret, true>(1));
    };
#pragma GCC diagnostic pop

 template<typename _Fn, typename... _ArgTypes>
    struct __is_invocable
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>::type
    { };

  template<typename _Fn, typename _Tp, typename... _Args>
    constexpr bool __call_is_nt(__invoke_memfun_ref)
    {
      using _Up = typename __inv_unwrap<_Tp>::type;
      return noexcept((std::declval<_Up>().*std::declval<_Fn>())(
     std::declval<_Args>()...));
    }

  template<typename _Fn, typename _Tp, typename... _Args>
    constexpr bool __call_is_nt(__invoke_memfun_deref)
    {
      return noexcept(((*std::declval<_Tp>()).*std::declval<_Fn>())(
     std::declval<_Args>()...));
    }

  template<typename _Fn, typename _Tp>
    constexpr bool __call_is_nt(__invoke_memobj_ref)
    {
      using _Up = typename __inv_unwrap<_Tp>::type;
      return noexcept(std::declval<_Up>().*std::declval<_Fn>());
    }

  template<typename _Fn, typename _Tp>
    constexpr bool __call_is_nt(__invoke_memobj_deref)
    {
      return noexcept((*std::declval<_Tp>()).*std::declval<_Fn>());
    }

  template<typename _Fn, typename... _Args>
    constexpr bool __call_is_nt(__invoke_other)
    {
      return noexcept(std::declval<_Fn>()(std::declval<_Args>()...));
    }

  template<typename _Result, typename _Fn, typename... _Args>
    struct __call_is_nothrow
    : __bool_constant<
 std::__call_is_nt<_Fn, _Args...>(typename _Result::__invoke_type{})
      >
    { };

  template<typename _Fn, typename... _Args>
    using __call_is_nothrow_
      = __call_is_nothrow<__invoke_result<_Fn, _Args...>, _Fn, _Args...>;


  template<typename _Fn, typename... _Args>
    struct __is_nothrow_invocable
    : __and_<__is_invocable<_Fn, _Args...>,
             __call_is_nothrow_<_Fn, _Args...>>::type
    { };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
 struct __nonesuchbase {};
  struct __nonesuch : private __nonesuchbase {
    ~__nonesuch() = delete;
    __nonesuch(__nonesuch const&) = delete;
    void operator=(__nonesuch const&) = delete;
  };
#pragma GCC diagnostic pop
# 3599 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits" 3
}
# 39 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/initializer_list" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/initializer_list" 3





#pragma GCC visibility push(default)



namespace std
{

  template<class _E>
    class initializer_list
    {
    public:
      typedef _E value_type;
      typedef const _E& reference;
      typedef const _E& const_reference;
      typedef size_t size_type;
      typedef const _E* iterator;
      typedef const _E* const_iterator;

    private:
      iterator _M_array;
      size_type _M_len;


      constexpr initializer_list(const_iterator __a, size_type __l)
      : _M_array(__a), _M_len(__l) { }

    public:
      constexpr initializer_list() noexcept
      : _M_array(0), _M_len(0) { }


      constexpr size_type
      size() const noexcept { return _M_len; }


      constexpr const_iterator
      begin() const noexcept { return _M_array; }


      constexpr const_iterator
      end() const noexcept { return begin() + size(); }
    };







  template<class _Tp>
    constexpr const _Tp*
    begin(initializer_list<_Tp> __ils) noexcept
    { return __ils.begin(); }







  template<class _Tp>
    constexpr const _Tp*
    end(initializer_list<_Tp> __ils) noexcept
    { return __ils.end(); }
}

#pragma GCC visibility pop
# 40 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h" 1 3
# 46 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++allocator.h" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++allocator.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/new" 1 3
# 39 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/new" 3


# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/exception.h" 1 3
# 35 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/exception.h" 3

#pragma GCC visibility push(default)



extern "C++" {

namespace std
{
# 61 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/exception.h" 3
  class exception
  {
  public:
    exception() noexcept { }
    virtual ~exception() noexcept;

    exception(const exception&) = default;
    exception& operator=(const exception&) = default;
    exception(exception&&) = default;
    exception& operator=(exception&&) = default;




    virtual const char*
    what() const noexcept;
  };



}

}

#pragma GCC visibility pop
# 42 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/new" 2 3

#pragma GCC visibility push(default)

extern "C++" {

namespace std
{






  class bad_alloc : public exception
  {
  public:
    bad_alloc() throw() { }


    bad_alloc(const bad_alloc&) = default;
    bad_alloc& operator=(const bad_alloc&) = default;




    virtual ~bad_alloc() throw();


    virtual const char* what() const throw();
  };


  class bad_array_new_length : public bad_alloc
  {
  public:
    bad_array_new_length() throw() { }



    virtual ~bad_array_new_length() throw();


    virtual const char* what() const throw();
  };






  struct nothrow_t
  {

    explicit nothrow_t() = default;

  };

  extern const nothrow_t nothrow;



  typedef void (*new_handler)();



  new_handler set_new_handler(new_handler) throw();



  new_handler get_new_handler() noexcept;

}
# 126 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/new" 3
                   void* operator new(std::size_t)
  __attribute__((__externally_visible__));
                   void* operator new[](std::size_t)
  __attribute__((__externally_visible__));
void operator delete(void*) noexcept
  __attribute__((__externally_visible__));
void operator delete[](void*) noexcept
  __attribute__((__externally_visible__));






                   void* operator new(std::size_t, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
                   void* operator new[](std::size_t, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
void operator delete(void*, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__));
void operator delete[](void*, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__));
# 174 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/new" 3
                   inline void* operator new(std::size_t, void* __p) noexcept
{ return __p; }
                   inline void* operator new[](std::size_t, void* __p) noexcept
{ return __p; }


inline void operator delete (void*, void*) noexcept { }
inline void operator delete[](void*, void*) noexcept { }

}
# 230 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/new" 3
#pragma GCC visibility pop
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functexcept.h" 1 3
# 40 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functexcept.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/exception_defines.h" 1 3
# 41 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functexcept.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{



  void
  __throw_bad_exception(void) __attribute__((__noreturn__));


  void
  __throw_bad_alloc(void) __attribute__((__noreturn__));

  void
  __throw_bad_array_new_length(void) __attribute__((__noreturn__));


  void
  __throw_bad_cast(void) __attribute__((__noreturn__));

  void
  __throw_bad_typeid(void) __attribute__((__noreturn__));


  void
  __throw_logic_error(const char*) __attribute__((__noreturn__));

  void
  __throw_domain_error(const char*) __attribute__((__noreturn__));

  void
  __throw_invalid_argument(const char*) __attribute__((__noreturn__));

  void
  __throw_length_error(const char*) __attribute__((__noreturn__));

  void
  __throw_out_of_range(const char*) __attribute__((__noreturn__));

  void
  __throw_out_of_range_fmt(const char*, ...) __attribute__((__noreturn__))
    __attribute__((__format__(__gnu_printf__, 1, 2)));

  void
  __throw_runtime_error(const char*) __attribute__((__noreturn__));

  void
  __throw_range_error(const char*) __attribute__((__noreturn__));

  void
  __throw_overflow_error(const char*) __attribute__((__noreturn__));

  void
  __throw_underflow_error(const char*) __attribute__((__noreturn__));


  void
  __throw_ios_failure(const char*) __attribute__((__noreturn__));

  void
  __throw_ios_failure(const char*, int) __attribute__((__noreturn__));


  void
  __throw_system_error(int) __attribute__((__noreturn__));


  void
  __throw_future_error(int) __attribute__((__noreturn__));


  void
  __throw_bad_function_call() __attribute__((__noreturn__));


}
# 35 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/move.h" 1 3
# 38 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/move.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{







  template<typename _Tp>
    inline constexpr _Tp*
    __addressof(_Tp& __r) noexcept
    { return __builtin_addressof(__r); }




}



namespace std __attribute__ ((__visibility__ ("default")))
{
# 74 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/move.h" 3
  template<typename _Tp>

    constexpr _Tp&&
    forward(typename std::remove_reference<_Tp>::type& __t) noexcept
    { return static_cast<_Tp&&>(__t); }







  template<typename _Tp>

    constexpr _Tp&&
    forward(typename std::remove_reference<_Tp>::type&& __t) noexcept
    {
      static_assert(!std::is_lvalue_reference<_Tp>::value,
   "std::forward must not be used to convert an rvalue to an lvalue");
      return static_cast<_Tp&&>(__t);
    }






  template<typename _Tp>

    constexpr typename std::remove_reference<_Tp>::type&&
    move(_Tp&& __t) noexcept
    { return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }


  template<typename _Tp>
    struct __move_if_noexcept_cond
    : public __and_<__not_<is_nothrow_move_constructible<_Tp>>,
                    is_copy_constructible<_Tp>>::type { };
# 121 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/move.h" 3
  template<typename _Tp>

    constexpr typename
    conditional<__move_if_noexcept_cond<_Tp>::value, const _Tp&, _Tp&&>::type
    move_if_noexcept(_Tp& __x) noexcept
    { return std::move(__x); }
# 142 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/move.h" 3
  template<typename _Tp>

    inline _Tp*
    addressof(_Tp& __r) noexcept
    { return std::__addressof(__r); }



  template<typename _Tp>
    const _Tp* addressof(const _Tp&&) = delete;


  template <typename _Tp, typename _Up = _Tp>

    inline _Tp
    __exchange(_Tp& __obj, _Up&& __new_val)
    {
      _Tp __old_val = std::move(__obj);
      __obj = std::forward<_Up>(__new_val);
      return __old_val;
    }
# 186 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/move.h" 3
  template<typename _Tp>

    inline

    typename enable_if<__and_<__not_<__is_tuple_like<_Tp>>,
         is_move_constructible<_Tp>,
         is_move_assignable<_Tp>>::value>::type



    swap(_Tp& __a, _Tp& __b)
    noexcept(__and_<is_nothrow_move_constructible<_Tp>, is_nothrow_move_assignable<_Tp>>::value)

    {




      _Tp __tmp = std::move(__a);
      __a = std::move(__b);
      __b = std::move(__tmp);
    }




  template<typename _Tp, size_t _Nm>

    inline

    typename enable_if<__is_swappable<_Tp>::value>::type



    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])
    noexcept(__is_nothrow_swappable<_Tp>::value)
    {
      for (size_t __n = 0; __n < _Nm; ++__n)
 swap(__a[__n], __b[__n]);
    }



}
# 36 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 2 3




namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
# 54 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 3
  template<typename _Tp>
    class new_allocator
    {
    public:
      typedef _Tp value_type;
      typedef std::size_t size_type;
      typedef std::ptrdiff_t difference_type;

      typedef _Tp* pointer;
      typedef const _Tp* const_pointer;
      typedef _Tp& reference;
      typedef const _Tp& const_reference;

      template<typename _Tp1>
 struct rebind
 { typedef new_allocator<_Tp1> other; };





      typedef std::true_type propagate_on_container_move_assignment;



      new_allocator() noexcept { }


      new_allocator(const new_allocator&) noexcept { }

      template<typename _Tp1>

 new_allocator(const new_allocator<_Tp1>&) noexcept { }


      ~new_allocator() noexcept { }

      pointer
      address(reference __x) const noexcept
      { return std::__addressof(__x); }

      const_pointer
      address(const_reference __x) const noexcept
      { return std::__addressof(__x); }




                         _Tp*
      allocate(size_type __n, const void* = static_cast<const void*>(0))
      {



  static_assert(sizeof(_Tp) != 0, "cannot allocate incomplete types");


 if (__builtin_expect(__n > this->_M_max_size(), false))
   {


     if (__n > (std::size_t(-1) / sizeof(_Tp)))
       std::__throw_bad_array_new_length();
     std::__throw_bad_alloc();
   }
# 127 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 3
 return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
      }


      void
      deallocate(_Tp* __p, size_type __t __attribute__ ((__unused__)))
      {
# 145 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 3
 ::operator delete(__p



    );
      }


      size_type
      max_size() const noexcept
      { return _M_max_size(); }


      template<typename _Up, typename... _Args>
 void
 construct(_Up* __p, _Args&&... __args)
 noexcept(std::is_nothrow_constructible<_Up, _Args...>::value)
 { ::new((void *)__p) _Up(std::forward<_Args>(__args)...); }

      template<typename _Up>
 void
 destroy(_Up* __p)
 noexcept(std::is_nothrow_destructible<_Up>::value)
 { __p->~_Up(); }
# 181 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h" 3
      template<typename _Up>
 friend bool
 operator==(const new_allocator&, const new_allocator<_Up>&)
 noexcept
 { return true; }


      template<typename _Up>
 friend bool
 operator!=(const new_allocator&, const new_allocator<_Up>&)
 noexcept
 { return false; }


    private:
      constexpr size_type
      _M_max_size() const noexcept
      {

 return std::size_t(9223372036854775807L) / sizeof(_Tp);



      }
    };


}
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++allocator.h" 2 3


namespace std
{
# 47 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++allocator.h" 3
  template<typename _Tp>
    using __allocator_base = __gnu_cxx::new_allocator<_Tp>;
}
# 47 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/memoryfwd.h" 1 3
# 47 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/memoryfwd.h" 3



namespace std __attribute__ ((__visibility__ ("default")))
{
# 63 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/memoryfwd.h" 3
  template<typename>
    class allocator;

  template<>
    class allocator<void>;



  template<typename, typename>
    struct uses_allocator;

  template<typename>
    struct allocator_traits;





}
# 48 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h" 2 3






namespace std __attribute__ ((__visibility__ ("default")))
{
# 71 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h" 3
  template<>
    class allocator<void>
    {
    public:
      typedef void value_type;
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;



      typedef void* pointer;
      typedef const void* const_pointer;

      template<typename _Tp1>
 struct rebind
 { typedef allocator<_Tp1> other; };





      using propagate_on_container_move_assignment = true_type;

      using is_always_equal

 = true_type;
# 113 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h" 3
    };
# 123 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h" 3
  template<typename _Tp>
    class allocator : public __allocator_base<_Tp>
    {
    public:
      typedef _Tp value_type;
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;



      typedef _Tp* pointer;
      typedef const _Tp* const_pointer;
      typedef _Tp& reference;
      typedef const _Tp& const_reference;

      template<typename _Tp1>
 struct rebind
 { typedef allocator<_Tp1> other; };





      using propagate_on_container_move_assignment = true_type;

      using is_always_equal

 = true_type;





      allocator() noexcept { }


      allocator(const allocator& __a) noexcept
      : __allocator_base<_Tp>(__a) { }



      allocator& operator=(const allocator&) = default;


      template<typename _Tp1>

 allocator(const allocator<_Tp1>&) noexcept { }




      ~allocator() noexcept { }
# 203 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h" 3
      friend bool
      operator==(const allocator&, const allocator&) noexcept
      { return true; }


      friend bool
      operator!=(const allocator&, const allocator&) noexcept
      { return false; }



    };

  template<typename _T1, typename _T2>
    inline bool
    operator==(const allocator<_T1>&, const allocator<_T2>&)
    noexcept
    { return true; }


  template<typename _T1, typename _T2>
    inline bool
    operator!=(const allocator<_T1>&, const allocator<_T2>&)
    noexcept
    { return false; }




  template<typename _Tp>
    class allocator<const _Tp>
    {
    public:
      typedef _Tp value_type;
      template<typename _Up> allocator(const allocator<_Up>&) { }
    };

  template<typename _Tp>
    class allocator<volatile _Tp>
    {
    public:
      typedef _Tp value_type;
      template<typename _Up> allocator(const allocator<_Up>&) { }
    };

  template<typename _Tp>
    class allocator<const volatile _Tp>
    {
    public:
      typedef _Tp value_type;
      template<typename _Up> allocator(const allocator<_Up>&) { }
    };






  extern template class allocator<char>;
  extern template class allocator<wchar_t>;






  template<typename _Alloc, bool = __is_empty(_Alloc)>
    struct __alloc_swap
    { static void _S_do_it(_Alloc&, _Alloc&) noexcept { } };

  template<typename _Alloc>
    struct __alloc_swap<_Alloc, false>
    {
      static void
      _S_do_it(_Alloc& __one, _Alloc& __two) noexcept
      {

 if (__one != __two)
   swap(__one, __two);
      }
    };


  template<typename _Alloc, bool = __is_empty(_Alloc)>
    struct __alloc_neq
    {
      static bool
      _S_do_it(const _Alloc&, const _Alloc&)
      { return false; }
    };

  template<typename _Alloc>
    struct __alloc_neq<_Alloc, false>
    {
      static bool
      _S_do_it(const _Alloc& __one, const _Alloc& __two)
      { return __one != __two; }
    };


  template<typename _Tp, bool
    = __or_<is_copy_constructible<typename _Tp::value_type>,
            is_nothrow_move_constructible<typename _Tp::value_type>>::value>
    struct __shrink_to_fit_aux
    { static bool _S_do_it(_Tp&) noexcept { return false; } };

  template<typename _Tp>
    struct __shrink_to_fit_aux<_Tp, true>
    {
      static bool
      _S_do_it(_Tp& __c) noexcept
      {

 try
   {
     _Tp(__make_move_if_noexcept_iterator(__c.begin()),
  __make_move_if_noexcept_iterator(__c.end()),
  __c.get_allocator()).swap(__c);
     return true;
   }
 catch(...)
   { return false; }



      }
    };



}
# 41 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/alloc_traits.h" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/alloc_traits.h" 3

# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 1 3
# 61 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h" 1 3
# 63 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h" 3
# 74 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{
# 93 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h" 3
  struct input_iterator_tag { };


  struct output_iterator_tag { };


  struct forward_iterator_tag : public input_iterator_tag { };



  struct bidirectional_iterator_tag : public forward_iterator_tag { };



  struct random_access_iterator_tag : public bidirectional_iterator_tag { };
# 125 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h" 3
  template<typename _Category, typename _Tp, typename _Distance = ptrdiff_t,
           typename _Pointer = _Tp*, typename _Reference = _Tp&>
    struct iterator
    {

      typedef _Category iterator_category;

      typedef _Tp value_type;

      typedef _Distance difference_type;

      typedef _Pointer pointer;

      typedef _Reference reference;
    };
# 149 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h" 3
  template<typename _Iterator>
    struct iterator_traits;




  template<typename _Iterator, typename = __void_t<>>
    struct __iterator_traits { };



  template<typename _Iterator>
    struct __iterator_traits<_Iterator,
        __void_t<typename _Iterator::iterator_category,
          typename _Iterator::value_type,
          typename _Iterator::difference_type,
          typename _Iterator::pointer,
          typename _Iterator::reference>>
    {
      typedef typename _Iterator::iterator_category iterator_category;
      typedef typename _Iterator::value_type value_type;
      typedef typename _Iterator::difference_type difference_type;
      typedef typename _Iterator::pointer pointer;
      typedef typename _Iterator::reference reference;
    };


  template<typename _Iterator>
    struct iterator_traits
    : public __iterator_traits<_Iterator> { };
# 209 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h" 3
  template<typename _Tp>
    struct iterator_traits<_Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef _Tp& reference;
    };


  template<typename _Tp>
    struct iterator_traits<const _Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef const _Tp* pointer;
      typedef const _Tp& reference;
    };






  template<typename _Iter>
    inline constexpr
    typename iterator_traits<_Iter>::iterator_category
    __iterator_category(const _Iter&)
    { return typename iterator_traits<_Iter>::iterator_category(); }




  template<typename _Iter>
    using __iterator_category_t
      = typename iterator_traits<_Iter>::iterator_category;

  template<typename _InIter>
    using _RequireInputIter =
      __enable_if_t<is_convertible<__iterator_category_t<_InIter>,
       input_iterator_tag>::value>;

  template<typename _It,
    typename _Cat = __iterator_category_t<_It>>
    struct __is_random_access_iter
      : is_base_of<random_access_iterator_tag, _Cat>
    {
      typedef is_base_of<random_access_iterator_tag, _Cat> _Base;
      enum { __value = _Base::value };
    };
# 269 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h" 3
}
# 62 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_funcs.h" 1 3
# 63 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_funcs.h" 3

# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/concept_check.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/concept_check.h" 3
# 65 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_funcs.h" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/debug/assertions.h" 1 3
# 66 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_funcs.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{




  template <typename> struct _List_iterator;
  template <typename> struct _List_const_iterator;


  template<typename _InputIterator>
    inline
    typename iterator_traits<_InputIterator>::difference_type
    __distance(_InputIterator __first, _InputIterator __last,
               input_iterator_tag)
    {



      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      while (__first != __last)
 {
   ++__first;
   ++__n;
 }
      return __n;
    }

  template<typename _RandomAccessIterator>
    inline
    typename iterator_traits<_RandomAccessIterator>::difference_type
    __distance(_RandomAccessIterator __first, _RandomAccessIterator __last,
               random_access_iterator_tag)
    {



      return __last - __first;
    }



  template<typename _Tp>
    ptrdiff_t
    __distance(std::_List_iterator<_Tp>,
        std::_List_iterator<_Tp>,
        input_iterator_tag);

  template<typename _Tp>
    ptrdiff_t
    __distance(std::_List_const_iterator<_Tp>,
        std::_List_const_iterator<_Tp>,
        input_iterator_tag);
# 135 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator>
    inline
    typename iterator_traits<_InputIterator>::difference_type
    distance(_InputIterator __first, _InputIterator __last)
    {

      return std::__distance(__first, __last,
        std::__iterator_category(__first));
    }

  template<typename _InputIterator, typename _Distance>
    inline void
    __advance(_InputIterator& __i, _Distance __n, input_iterator_tag)
    {


      do { if (__builtin_is_constant_evaluated() && !bool(__n >= 0)) __builtin_unreachable(); } while (false);
      while (__n--)
 ++__i;
    }

  template<typename _BidirectionalIterator, typename _Distance>
    inline void
    __advance(_BidirectionalIterator& __i, _Distance __n,
       bidirectional_iterator_tag)
    {



      if (__n > 0)
        while (__n--)
   ++__i;
      else
        while (__n++)
   --__i;
    }

  template<typename _RandomAccessIterator, typename _Distance>
    inline void
    __advance(_RandomAccessIterator& __i, _Distance __n,
              random_access_iterator_tag)
    {



      if (__builtin_constant_p(__n) && __n == 1)
 ++__i;
      else if (__builtin_constant_p(__n) && __n == -1)
 --__i;
      else
 __i += __n;
    }
# 200 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator, typename _Distance>
    inline void
    advance(_InputIterator& __i, _Distance __n)
    {

      typename iterator_traits<_InputIterator>::difference_type __d = __n;
      std::__advance(__i, __d, std::__iterator_category(__i));
    }



  template<typename _InputIterator>
    inline _InputIterator
    next(_InputIterator __x, typename
  iterator_traits<_InputIterator>::difference_type __n = 1)
    {


      std::advance(__x, __n);
      return __x;
    }

  template<typename _BidirectionalIterator>
    inline _BidirectionalIterator
    prev(_BidirectionalIterator __x, typename
  iterator_traits<_BidirectionalIterator>::difference_type __n = 1)
    {



      std::advance(__x, -__n);
      return __x;
    }




}
# 63 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 2 3
# 73 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{
# 106 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 3
  template<typename _Tp, typename... _Args>

    inline void
    _Construct(_Tp* __p, _Args&&... __args)
    {
# 119 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 3
      ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
    }
# 132 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 3
  template<typename _T1>
    inline void
    _Construct_novalue(_T1* __p)
    { ::new((void*)__p) _T1; }

  template<typename _ForwardIterator>
                         void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last);




  template<typename _Tp>
                         inline void
    _Destroy(_Tp* __pointer)
    {



      __pointer->~_Tp();

    }

  template<bool>
    struct _Destroy_aux
    {
      template<typename _ForwardIterator>
 static void
 __destroy(_ForwardIterator __first, _ForwardIterator __last)
 {
   for (; __first != __last; ++__first)
     std::_Destroy(std::__addressof(*__first));
 }
    };

  template<>
    struct _Destroy_aux<true>
    {
      template<typename _ForwardIterator>
        static void
        __destroy(_ForwardIterator, _ForwardIterator) { }
    };






  template<typename _ForwardIterator>
                         inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;


      static_assert(is_destructible<_Value_type>::value,
      "value type is destructible");





      std::_Destroy_aux<__has_trivial_destructor(_Value_type)>::
 __destroy(__first, __last);
    }

  template<bool>
    struct _Destroy_n_aux
    {
      template<typename _ForwardIterator, typename _Size>
 static _ForwardIterator
 __destroy_n(_ForwardIterator __first, _Size __count)
 {
   for (; __count > 0; (void)++__first, --__count)
     std::_Destroy(std::__addressof(*__first));
   return __first;
 }
    };

  template<>
    struct _Destroy_n_aux<true>
    {
      template<typename _ForwardIterator, typename _Size>
        static _ForwardIterator
        __destroy_n(_ForwardIterator __first, _Size __count)
 {
   std::advance(__first, __count);
   return __first;
 }
    };






  template<typename _ForwardIterator, typename _Size>
                         inline _ForwardIterator
    _Destroy_n(_ForwardIterator __first, _Size __count)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;


      static_assert(is_destructible<_Value_type>::value,
      "value type is destructible");





      return std::_Destroy_n_aux<__has_trivial_destructor(_Value_type)>::
 __destroy_n(__first, __count);
    }
# 265 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h" 3
}
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 2 3



# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/ptr_traits.h" 1 3
# 42 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/ptr_traits.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  class __undefined;


  template<typename _Tp, typename _Up>
    struct __replace_first_arg
    { };

  template<template<typename, typename...> class _Template, typename _Up,
           typename _Tp, typename... _Types>
    struct __replace_first_arg<_Template<_Tp, _Types...>, _Up>
    { using type = _Template<_Up, _Types...>; };

  template<typename _Tp, typename _Up>
    using __replace_first_arg_t = typename __replace_first_arg<_Tp, _Up>::type;

  template<typename _Tp>
    using __make_not_void
      = typename conditional<is_void<_Tp>::value, __undefined, _Tp>::type;

  template<typename _Ptr>
    struct __ptr_traits_elem_1
    { };

  template<template<typename, typename...> class _SomePointer, typename _Tp,
    typename... _Args>
    struct __ptr_traits_elem_1<_SomePointer<_Tp, _Args...>>
    {
      using element_type = _Tp;
      using pointer = _SomePointer<_Tp, _Args...>;

      static pointer
      pointer_to(__make_not_void<element_type>& __e)
      { return pointer::pointer_to(__e); }
    };

  template<typename _Ptr, typename = void>
    struct __ptr_traits_elem : __ptr_traits_elem_1<_Ptr>
    { };

  template<typename _Ptr>
    struct __ptr_traits_elem<_Ptr, __void_t<typename _Ptr::element_type>>
    {
      using element_type = typename _Ptr::element_type;

      static _Ptr
      pointer_to(__make_not_void<element_type>& __e)
      { return _Ptr::pointer_to(__e); }
    };





  template<typename _Ptr>
    struct pointer_traits : __ptr_traits_elem<_Ptr>
    {
    private:
      template<typename _Tp>
 using __difference_type = typename _Tp::difference_type;

      template<typename _Tp, typename _Up, typename = void>
 struct __rebind : __replace_first_arg<_Tp, _Up> { };

      template<typename _Tp, typename _Up>
 struct __rebind<_Tp, _Up, __void_t<typename _Tp::template rebind<_Up>>>
 { using type = typename _Tp::template rebind<_Up>; };

    public:

      using pointer = _Ptr;


      using difference_type
 = __detected_or_t<ptrdiff_t, __difference_type, _Ptr>;


      template<typename _Up>
        using rebind = typename __rebind<_Ptr, _Up>::type;
    };





  template<typename _Tp>
    struct pointer_traits<_Tp*>
    {

      typedef _Tp* pointer;

      typedef _Tp element_type;

      typedef ptrdiff_t difference_type;

      template<typename _Up>
        using rebind = _Up*;






      static pointer
      pointer_to(__make_not_void<element_type>& __r) noexcept
      { return std::addressof(__r); }
    };


  template<typename _Ptr, typename _Tp>
    using __ptr_rebind = typename pointer_traits<_Ptr>::template rebind<_Tp>;

  template<typename _Tp>
    constexpr _Tp*
    __to_address(_Tp* __ptr) noexcept
    {
      static_assert(!std::is_function<_Tp>::value, "not a function pointer");
      return __ptr;
    }


  template<typename _Ptr>
    constexpr typename std::pointer_traits<_Ptr>::element_type*
    __to_address(const _Ptr& __ptr)
    { return std::__to_address(__ptr.operator->()); }
# 215 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/ptr_traits.h" 3
}
# 38 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/numeric_traits.h" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/numeric_traits.h" 3

# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/cpp_type_traits.h" 1 3
# 36 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/cpp_type_traits.h" 3
# 67 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/cpp_type_traits.h" 3
extern "C++" {

namespace std __attribute__ ((__visibility__ ("default")))
{


  struct __true_type { };
  struct __false_type { };

  template<bool>
    struct __truth_type
    { typedef __false_type __type; };

  template<>
    struct __truth_type<true>
    { typedef __true_type __type; };



  template<class _Sp, class _Tp>
    struct __traitor
    {
      enum { __value = bool(_Sp::__value) || bool(_Tp::__value) };
      typedef typename __truth_type<__value>::__type __type;
    };


  template<typename, typename>
    struct __are_same
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __are_same<_Tp, _Tp>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_void
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_void<void>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_integer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };





  template<>
    struct __is_integer<bool>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_integer<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 184 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/cpp_type_traits.h" 3
  template<>
    struct __is_integer<char16_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<char32_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_integer<short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 287 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/cpp_type_traits.h" 3
  template<typename _Tp>
    struct __is_floating
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };


  template<>
    struct __is_floating<float>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<long double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_pointer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __is_pointer<_Tp*>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_arithmetic
    : public __traitor<__is_integer<_Tp>, __is_floating<_Tp> >
    { };




  template<typename _Tp>
    struct __is_scalar
    : public __traitor<__is_arithmetic<_Tp>, __is_pointer<_Tp> >
    { };




  template<typename _Tp>
    struct __is_char
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_char<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_char<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_byte
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_byte<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 423 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/cpp_type_traits.h" 3
  template<typename> struct iterator_traits;


  template<typename _Tp>
    struct __is_nonvolatile_trivially_copyable
    {
      enum { __value = __is_trivially_copyable(_Tp) };
    };




  template<typename _Tp>
    struct __is_nonvolatile_trivially_copyable<volatile _Tp>
    {
      enum { __value = 0 };
    };


  template<typename _OutputIter, typename _InputIter>
    struct __memcpyable
    {
      enum { __value = 0 };
    };

  template<typename _Tp>
    struct __memcpyable<_Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };

  template<typename _Tp>
    struct __memcpyable<_Tp*, const _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };






  template<typename _Iter1, typename _Iter2>
    struct __memcmpable
    {
      enum { __value = 0 };
    };


  template<typename _Tp>
    struct __memcmpable<_Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };

  template<typename _Tp>
    struct __memcmpable<const _Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };

  template<typename _Tp>
    struct __memcmpable<_Tp*, const _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };







  template<typename _Tp, bool _TreatAsBytes =



 __is_byte<_Tp>::__value

    >
    struct __is_memcmp_ordered
    {
      static const bool __value = _Tp(-1) > _Tp(1);
    };

  template<typename _Tp>
    struct __is_memcmp_ordered<_Tp, false>
    {
      static const bool __value = false;
    };


  template<typename _Tp, typename _Up, bool = sizeof(_Tp) == sizeof(_Up)>
    struct __is_memcmp_ordered_with
    {
      static const bool __value = __is_memcmp_ordered<_Tp>::__value
 && __is_memcmp_ordered<_Up>::__value;
    };

  template<typename _Tp, typename _Up>
    struct __is_memcmp_ordered_with<_Tp, _Up, false>
    {
      static const bool __value = false;
    };
# 548 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/cpp_type_traits.h" 3
  template<typename _Tp>
    struct __is_move_iterator
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };



  template<typename _Iterator>

    inline _Iterator
    __miter_base(_Iterator __it)
    { return __it; }


}
}
# 35 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/numeric_traits.h" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/type_traits.h" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/type_traits.h" 3




extern "C++" {

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  template<bool, typename>
    struct __enable_if
    { };

  template<typename _Tp>
    struct __enable_if<true, _Tp>
    { typedef _Tp __type; };



  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct __conditional_type
    { typedef _Iftrue __type; };

  template<typename _Iftrue, typename _Iffalse>
    struct __conditional_type<false, _Iftrue, _Iffalse>
    { typedef _Iffalse __type; };



  template<typename _Tp>
    struct __add_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __add_unsigned<char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<signed char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<short>
    { typedef unsigned short __type; };

  template<>
    struct __add_unsigned<int>
    { typedef unsigned int __type; };

  template<>
    struct __add_unsigned<long>
    { typedef unsigned long __type; };

  template<>
    struct __add_unsigned<long long>
    { typedef unsigned long long __type; };


  template<>
    struct __add_unsigned<bool>;

  template<>
    struct __add_unsigned<wchar_t>;



  template<typename _Tp>
    struct __remove_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __remove_unsigned<char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned short>
    { typedef short __type; };

  template<>
    struct __remove_unsigned<unsigned int>
    { typedef int __type; };

  template<>
    struct __remove_unsigned<unsigned long>
    { typedef long __type; };

  template<>
    struct __remove_unsigned<unsigned long long>
    { typedef long long __type; };


  template<>
    struct __remove_unsigned<bool>;

  template<>
    struct __remove_unsigned<wchar_t>;



  template<typename _Type>
    inline bool
    __is_null_pointer(_Type* __ptr)
    { return __ptr == 0; }

  template<typename _Type>
    inline bool
    __is_null_pointer(_Type)
    { return false; }


  inline bool
  __is_null_pointer(std::nullptr_t)
  { return true; }




  template<typename _Tp, bool = std::__is_integer<_Tp>::__value>
    struct __promote
    { typedef double __type; };




  template<typename _Tp>
    struct __promote<_Tp, false>
    { };

  template<>
    struct __promote<long double>
    { typedef long double __type; };

  template<>
    struct __promote<double>
    { typedef double __type; };

  template<>
    struct __promote<float>
    { typedef float __type; };






  template<typename _Tp, typename _Up,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type>
    struct __promote_2
    {
      typedef __typeof__(_Tp2() + _Up2()) __type;
    };

  template<typename _Tp, typename _Up, typename _Vp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type>
    struct __promote_3
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2()) __type;
    };

  template<typename _Tp, typename _Up, typename _Vp, typename _Wp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type,
           typename _Wp2 = typename __promote<_Wp>::__type>
    struct __promote_4
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2() + _Wp2()) __type;
    };


}
}
# 36 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/numeric_traits.h" 2 3

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
# 50 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/numeric_traits.h" 3
  template<typename _Tp>
    struct __is_integer_nonstrict
    : public std::__is_integer<_Tp>
    {
      using std::__is_integer<_Tp>::__value;


      enum { __width = __value ? sizeof(_Tp) * 8 : 0 };
    };

  template<typename _Value>
    struct __numeric_traits_integer
    {

      static_assert(__is_integer_nonstrict<_Value>::__value,
      "invalid specialization");




      static const bool __is_signed = (_Value)(-1) < 0;
      static const int __digits
 = __is_integer_nonstrict<_Value>::__width - __is_signed;


      static const _Value __max = __is_signed
 ? (((((_Value)1 << (__digits - 1)) - 1) << 1) + 1)
 : ~(_Value)0;
      static const _Value __min = __is_signed ? -__max - 1 : (_Value)0;
    };

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__min;

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__max;

  template<typename _Value>
    const bool __numeric_traits_integer<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_integer<_Value>::__digits;
# 128 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/numeric_traits.h" 3
  template<> struct __is_integer_nonstrict<__int128> { enum { __value = 1 }; typedef std::__true_type __type; enum { __width = 128 }; }; template<> struct __is_integer_nonstrict<unsigned __int128> { enum { __value = 1 }; typedef std::__true_type __type; enum { __width = 128 }; };






  template<typename _Tp>
    using __int_traits = __numeric_traits_integer<_Tp>;
# 155 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/numeric_traits.h" 3
  template<typename _Value>
    struct __numeric_traits_floating
    {

      static const int __max_digits10 = (2 + (std::__are_same<_Value, float>::__value ? 24 : std::__are_same<_Value, double>::__value ? 53 : 64) * 643L / 2136);


      static const bool __is_signed = true;
      static const int __digits10 = (std::__are_same<_Value, float>::__value ? 6 : std::__are_same<_Value, double>::__value ? 15 : 18);
      static const int __max_exponent10 = (std::__are_same<_Value, float>::__value ? 38 : std::__are_same<_Value, double>::__value ? 308 : 4932);
    };

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_digits10;

  template<typename _Value>
    const bool __numeric_traits_floating<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__digits10;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_exponent10;






  template<typename _Value>
    struct __numeric_traits
    : public __numeric_traits_integer<_Value>
    { };

  template<>
    struct __numeric_traits<float>
    : public __numeric_traits_floating<float>
    { };

  template<>
    struct __numeric_traits<double>
    : public __numeric_traits_floating<double>
    { };

  template<>
    struct __numeric_traits<long double>
    : public __numeric_traits_floating<long double>
    { };
# 237 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/numeric_traits.h" 3
}
# 39 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 2 3


namespace std __attribute__ ((__visibility__ ("default")))
{






  struct __allocator_traits_base
  {
    template<typename _Tp, typename _Up, typename = void>
      struct __rebind : __replace_first_arg<_Tp, _Up> { };

    template<typename _Tp, typename _Up>
      struct __rebind<_Tp, _Up,
        __void_t<typename _Tp::template rebind<_Up>::other>>
      { using type = typename _Tp::template rebind<_Up>::other; };

  protected:
    template<typename _Tp>
      using __pointer = typename _Tp::pointer;
    template<typename _Tp>
      using __c_pointer = typename _Tp::const_pointer;
    template<typename _Tp>
      using __v_pointer = typename _Tp::void_pointer;
    template<typename _Tp>
      using __cv_pointer = typename _Tp::const_void_pointer;
    template<typename _Tp>
      using __pocca = typename _Tp::propagate_on_container_copy_assignment;
    template<typename _Tp>
      using __pocma = typename _Tp::propagate_on_container_move_assignment;
    template<typename _Tp>
      using __pocs = typename _Tp::propagate_on_container_swap;
    template<typename _Tp>
      using __equal = typename _Tp::is_always_equal;
  };

  template<typename _Alloc, typename _Up>
    using __alloc_rebind
      = typename __allocator_traits_base::template __rebind<_Alloc, _Up>::type;
# 89 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
  template<typename _Alloc>
    struct allocator_traits : __allocator_traits_base
    {

      typedef _Alloc allocator_type;

      typedef typename _Alloc::value_type value_type;






      using pointer = __detected_or_t<value_type*, __pointer, _Alloc>;

    private:

      template<template<typename> class _Func, typename _Tp, typename = void>
 struct _Ptr
 {
   using type = typename pointer_traits<pointer>::template rebind<_Tp>;
 };

      template<template<typename> class _Func, typename _Tp>
 struct _Ptr<_Func, _Tp, __void_t<_Func<_Alloc>>>
 {
   using type = _Func<_Alloc>;
 };


      template<typename _A2, typename _PtrT, typename = void>
 struct _Diff
 { using type = typename pointer_traits<_PtrT>::difference_type; };

      template<typename _A2, typename _PtrT>
 struct _Diff<_A2, _PtrT, __void_t<typename _A2::difference_type>>
 { using type = typename _A2::difference_type; };


      template<typename _A2, typename _DiffT, typename = void>
 struct _Size : make_unsigned<_DiffT> { };

      template<typename _A2, typename _DiffT>
 struct _Size<_A2, _DiffT, __void_t<typename _A2::size_type>>
 { using type = typename _A2::size_type; };

    public:






      using const_pointer = typename _Ptr<__c_pointer, const value_type>::type;







      using void_pointer = typename _Ptr<__v_pointer, void>::type;







      using const_void_pointer = typename _Ptr<__cv_pointer, const void>::type;







      using difference_type = typename _Diff<_Alloc, pointer>::type;







      using size_type = typename _Size<_Alloc, difference_type>::type;







      using propagate_on_container_copy_assignment
 = __detected_or_t<false_type, __pocca, _Alloc>;







      using propagate_on_container_move_assignment
 = __detected_or_t<false_type, __pocma, _Alloc>;







      using propagate_on_container_swap
 = __detected_or_t<false_type, __pocs, _Alloc>;







      using is_always_equal
 = __detected_or_t<typename is_empty<_Alloc>::type, __equal, _Alloc>;

      template<typename _Tp>
 using rebind_alloc = __alloc_rebind<_Alloc, _Tp>;
      template<typename _Tp>
 using rebind_traits = allocator_traits<rebind_alloc<_Tp>>;

    private:
      template<typename _Alloc2>
 static constexpr auto
 _S_allocate(_Alloc2& __a, size_type __n, const_void_pointer __hint, int)
 -> decltype(__a.allocate(__n, __hint))
 { return __a.allocate(__n, __hint); }

      template<typename _Alloc2>
 static constexpr pointer
 _S_allocate(_Alloc2& __a, size_type __n, const_void_pointer, ...)
 { return __a.allocate(__n); }

      template<typename _Tp, typename... _Args>
 struct __construct_helper
 {
   template<typename _Alloc2,
     typename = decltype(std::declval<_Alloc2*>()->construct(
    std::declval<_Tp*>(), std::declval<_Args>()...))>
     static true_type __test(int);

   template<typename>
     static false_type __test(...);

   using type = decltype(__test<_Alloc>(0));
 };

      template<typename _Tp, typename... _Args>
 using __has_construct
   = typename __construct_helper<_Tp, _Args...>::type;

      template<typename _Tp, typename... _Args>
 static _Require<__has_construct<_Tp, _Args...>>
 _S_construct(_Alloc& __a, _Tp* __p, _Args&&... __args)
 noexcept(noexcept(__a.construct(__p, std::forward<_Args>(__args)...)))
 { __a.construct(__p, std::forward<_Args>(__args)...); }

      template<typename _Tp, typename... _Args>
 static
 _Require<__and_<__not_<__has_construct<_Tp, _Args...>>,
          is_constructible<_Tp, _Args...>>>
 _S_construct(_Alloc&, _Tp* __p, _Args&&... __args)
 noexcept(std::is_nothrow_constructible<_Tp, _Args...>::value)
 {

   ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);



 }

      template<typename _Alloc2, typename _Tp>
 static auto
 _S_destroy(_Alloc2& __a, _Tp* __p, int)
 noexcept(noexcept(__a.destroy(__p)))
 -> decltype(__a.destroy(__p))
 { __a.destroy(__p); }

      template<typename _Alloc2, typename _Tp>
 static void
 _S_destroy(_Alloc2&, _Tp* __p, ...)
 noexcept(std::is_nothrow_destructible<_Tp>::value)
 { std::_Destroy(__p); }

      template<typename _Alloc2>
 static constexpr auto
 _S_max_size(_Alloc2& __a, int)
 -> decltype(__a.max_size())
 { return __a.max_size(); }

      template<typename _Alloc2>
 static constexpr size_type
 _S_max_size(_Alloc2&, ...)
 {


   return __gnu_cxx::__numeric_traits<size_type>::__max
     / sizeof(value_type);
 }

      template<typename _Alloc2>
 static constexpr auto
 _S_select(_Alloc2& __a, int)
 -> decltype(__a.select_on_container_copy_construction())
 { return __a.select_on_container_copy_construction(); }

      template<typename _Alloc2>
 static constexpr _Alloc2
 _S_select(_Alloc2& __a, ...)
 { return __a; }

    public:
# 316 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
                         static pointer
      allocate(_Alloc& __a, size_type __n)
      { return __a.allocate(__n); }
# 331 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
                         static pointer
      allocate(_Alloc& __a, size_type __n, const_void_pointer __hint)
      { return _S_allocate(__a, __n, __hint, 0); }
# 343 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      static void
      deallocate(_Alloc& __a, pointer __p, size_type __n)
      { __a.deallocate(__p, __n); }
# 358 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      template<typename _Tp, typename... _Args>
 static auto
 construct(_Alloc& __a, _Tp* __p, _Args&&... __args)
 noexcept(noexcept(_S_construct(__a, __p,
           std::forward<_Args>(__args)...)))
 -> decltype(_S_construct(__a, __p, std::forward<_Args>(__args)...))
 { _S_construct(__a, __p, std::forward<_Args>(__args)...); }
# 374 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      template<typename _Tp>
 static void
 destroy(_Alloc& __a, _Tp* __p)
 noexcept(noexcept(_S_destroy(__a, __p, 0)))
 { _S_destroy(__a, __p, 0); }
# 388 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      static size_type
      max_size(const _Alloc& __a) noexcept
      { return _S_max_size(__a, 0); }
# 400 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      static _Alloc
      select_on_container_copy_construction(const _Alloc& __rhs)
      { return _S_select(__rhs, 0); }
    };






  template<typename _Tp>
    struct allocator_traits<allocator<_Tp>>
    {

      using allocator_type = allocator<_Tp>;


      using value_type = _Tp;


      using pointer = _Tp*;


      using const_pointer = const _Tp*;


      using void_pointer = void*;


      using const_void_pointer = const void*;


      using difference_type = std::ptrdiff_t;


      using size_type = std::size_t;


      using propagate_on_container_copy_assignment = false_type;


      using propagate_on_container_move_assignment = true_type;


      using propagate_on_container_swap = false_type;


      using is_always_equal = true_type;

      template<typename _Up>
 using rebind_alloc = allocator<_Up>;

      template<typename _Up>
 using rebind_traits = allocator_traits<allocator<_Up>>;
# 462 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
                         static pointer
      allocate(allocator_type& __a, size_type __n)
      { return __a.allocate(__n); }
# 476 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
                         static pointer
      allocate(allocator_type& __a, size_type __n, const_void_pointer __hint)
      {

 return __a.allocate(__n, __hint);



      }
# 494 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      static void
      deallocate(allocator_type& __a, pointer __p, size_type __n)
      { __a.deallocate(__p, __n); }
# 509 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      template<typename _Up, typename... _Args>
 static void
 construct(allocator_type& __a __attribute__((__unused__)), _Up* __p,
    _Args&&... __args)
 noexcept(std::is_nothrow_constructible<_Up, _Args...>::value)
 {

   __a.construct(__p, std::forward<_Args>(__args)...);



 }
# 529 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      template<typename _Up>
 static void
 destroy(allocator_type& __a __attribute__((__unused__)), _Up* __p)
 noexcept(is_nothrow_destructible<_Up>::value)
 {

   __a.destroy(__p);



 }






      static size_type
      max_size(const allocator_type& __a __attribute__((__unused__))) noexcept
      {

 return __a.max_size();



      }






      static allocator_type
      select_on_container_copy_construction(const allocator_type& __rhs)
      { return __rhs; }
    };


  template<>
    struct allocator_traits<allocator<void>>
    {

      using allocator_type = allocator<void>;


      using value_type = void;


      using pointer = void*;


      using const_pointer = const void*;


      using void_pointer = void*;


      using const_void_pointer = const void*;


      using difference_type = std::ptrdiff_t;


      using size_type = std::size_t;


      using propagate_on_container_copy_assignment = false_type;


      using propagate_on_container_move_assignment = true_type;


      using propagate_on_container_swap = false_type;


      using is_always_equal = true_type;

      template<typename _Up>
 using rebind_alloc = allocator<_Up>;

      template<typename _Up>
 using rebind_traits = allocator_traits<allocator<_Up>>;


      static void*
      allocate(allocator_type&, size_type, const void* = nullptr) = delete;


      static void
      deallocate(allocator_type&, void*, size_type) = delete;
# 631 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      template<typename _Up, typename... _Args>
 static void
 construct(allocator_type&, _Up* __p, _Args&&... __args)
 noexcept(std::is_nothrow_constructible<_Up, _Args...>::value)
 { std::_Construct(__p, std::forward<_Args>(__args)...); }
# 644 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
      template<typename _Up>
 static void
 destroy(allocator_type&, _Up* __p)
 noexcept(is_nothrow_destructible<_Up>::value)
 { std::_Destroy(__p); }


      static size_type
      max_size(const allocator_type&) = delete;






      static allocator_type
      select_on_container_copy_construction(const allocator_type& __rhs)
      { return __rhs; }
    };


  template<typename _Alloc>
    inline void
    __do_alloc_on_copy(_Alloc& __one, const _Alloc& __two, true_type)
    { __one = __two; }

  template<typename _Alloc>
    inline void
    __do_alloc_on_copy(_Alloc&, const _Alloc&, false_type)
    { }


  template<typename _Alloc>
                         inline void
    __alloc_on_copy(_Alloc& __one, const _Alloc& __two)
    {
      typedef allocator_traits<_Alloc> __traits;
      typedef typename __traits::propagate_on_container_copy_assignment __pocca;




      __do_alloc_on_copy(__one, __two, __pocca());

    }

  template<typename _Alloc>
    constexpr _Alloc
    __alloc_on_copy(const _Alloc& __a)
    {
      typedef allocator_traits<_Alloc> __traits;
      return __traits::select_on_container_copy_construction(__a);
    }


  template<typename _Alloc>
    inline void __do_alloc_on_move(_Alloc& __one, _Alloc& __two, true_type)
    { __one = std::move(__two); }

  template<typename _Alloc>
    inline void __do_alloc_on_move(_Alloc&, _Alloc&, false_type)
    { }


  template<typename _Alloc>
                         inline void
    __alloc_on_move(_Alloc& __one, _Alloc& __two)
    {
      typedef allocator_traits<_Alloc> __traits;
      typedef typename __traits::propagate_on_container_move_assignment __pocma;




      __do_alloc_on_move(__one, __two, __pocma());

    }


  template<typename _Alloc>
    inline void __do_alloc_on_swap(_Alloc& __one, _Alloc& __two, true_type)
    {
      using std::swap;
      swap(__one, __two);
    }

  template<typename _Alloc>
    inline void __do_alloc_on_swap(_Alloc&, _Alloc&, false_type)
    { }


  template<typename _Alloc>
                         inline void
    __alloc_on_swap(_Alloc& __one, _Alloc& __two)
    {
      typedef allocator_traits<_Alloc> __traits;
      typedef typename __traits::propagate_on_container_swap __pocs;







      __do_alloc_on_swap(__one, __two, __pocs());

    }

  template<typename _Alloc, typename _Tp,
    typename _ValueT = __remove_cvref_t<typename _Alloc::value_type>,
    typename = void>
    struct __is_alloc_insertable_impl
    : false_type
    { };

  template<typename _Alloc, typename _Tp, typename _ValueT>
    struct __is_alloc_insertable_impl<_Alloc, _Tp, _ValueT,
      __void_t<decltype(allocator_traits<_Alloc>::construct(
     std::declval<_Alloc&>(), std::declval<_ValueT*>(),
     std::declval<_Tp>()))>>
    : true_type
    { };




  template<typename _Alloc>
    struct __is_copy_insertable
    : __is_alloc_insertable_impl<_Alloc,
     typename _Alloc::value_type const&>::type
    { };


  template<typename _Tp>
    struct __is_copy_insertable<allocator<_Tp>>
    : is_copy_constructible<_Tp>
    { };




  template<typename _Alloc>
    struct __is_move_insertable
    : __is_alloc_insertable_impl<_Alloc, typename _Alloc::value_type>::type
    { };


  template<typename _Tp>
    struct __is_move_insertable<allocator<_Tp>>
    : is_move_constructible<_Tp>
    { };


  template<typename _Alloc, typename = void>
    struct __is_allocator : false_type { };

  template<typename _Alloc>
    struct __is_allocator<_Alloc,
      __void_t<typename _Alloc::value_type,
        decltype(std::declval<_Alloc&>().allocate(size_t{}))>>
    : true_type { };

  template<typename _Alloc>
    using _RequireAllocator
      = typename enable_if<__is_allocator<_Alloc>::value, _Alloc>::type;

  template<typename _Alloc>
    using _RequireNotAllocator
      = typename enable_if<!__is_allocator<_Alloc>::value, _Alloc>::type;
# 829 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h" 3
  template<typename _ForwardIterator, typename _Allocator>
    void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
      _Allocator& __alloc)
    {
      for (; __first != __last; ++__first)



 allocator_traits<_Allocator>::destroy(__alloc,
           std::__addressof(*__first));

    }

  template<typename _ForwardIterator, typename _Tp>
    inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
      allocator<_Tp>&)
    {
      _Destroy(__first, __last);
    }


}
# 35 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/alloc_traits.h" 2 3




namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{






template<typename _Alloc, typename = typename _Alloc::value_type>
  struct __alloc_traits

  : std::allocator_traits<_Alloc>

  {
    typedef _Alloc allocator_type;

    typedef std::allocator_traits<_Alloc> _Base_type;
    typedef typename _Base_type::value_type value_type;
    typedef typename _Base_type::pointer pointer;
    typedef typename _Base_type::const_pointer const_pointer;
    typedef typename _Base_type::size_type size_type;
    typedef typename _Base_type::difference_type difference_type;

    typedef value_type& reference;
    typedef const value_type& const_reference;
    using _Base_type::allocate;
    using _Base_type::deallocate;
    using _Base_type::construct;
    using _Base_type::destroy;
    using _Base_type::max_size;

  private:
    template<typename _Ptr>
      using __is_custom_pointer
 = std::__and_<std::is_same<pointer, _Ptr>,
        std::__not_<std::is_pointer<_Ptr>>>;

  public:

    template<typename _Ptr, typename... _Args>
      static
      std::__enable_if_t<__is_custom_pointer<_Ptr>::value>
      construct(_Alloc& __a, _Ptr __p, _Args&&... __args)
      noexcept(noexcept(_Base_type::construct(__a, std::__to_address(__p),
           std::forward<_Args>(__args)...)))
      {
 _Base_type::construct(__a, std::__to_address(__p),
         std::forward<_Args>(__args)...);
      }


    template<typename _Ptr>
      static
      std::__enable_if_t<__is_custom_pointer<_Ptr>::value>
      destroy(_Alloc& __a, _Ptr __p)
      noexcept(noexcept(_Base_type::destroy(__a, std::__to_address(__p))))
      { _Base_type::destroy(__a, std::__to_address(__p)); }

    static constexpr _Alloc _S_select_on_copy(const _Alloc& __a)
    { return _Base_type::select_on_container_copy_construction(__a); }

    static void _S_on_swap(_Alloc& __a, _Alloc& __b)
    { std::__alloc_on_swap(__a, __b); }

    static constexpr bool _S_propagate_on_copy_assign()
    { return _Base_type::propagate_on_container_copy_assignment::value; }

    static constexpr bool _S_propagate_on_move_assign()
    { return _Base_type::propagate_on_container_move_assignment::value; }

    static constexpr bool _S_propagate_on_swap()
    { return _Base_type::propagate_on_container_swap::value; }

    static constexpr bool _S_always_equal()
    { return _Base_type::is_always_equal::value; }

    static constexpr bool _S_nothrow_move()
    { return _S_propagate_on_move_assign() || _S_always_equal(); }

    template<typename _Tp>
      struct rebind
      { typedef typename _Base_type::template rebind_alloc<_Tp> other; };
# 166 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/alloc_traits.h" 3
  };


}
# 42 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/aligned_buffer.h" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/aligned_buffer.h" 3







namespace __gnu_cxx
{




  template<typename _Tp>
    struct __aligned_membuf
    {





      struct _Tp2 { _Tp _M_t; };

      alignas(__alignof__(_Tp2::_M_t)) unsigned char _M_storage[sizeof(_Tp)];

      __aligned_membuf() = default;


      __aligned_membuf(std::nullptr_t) { }

      void*
      _M_addr() noexcept
      { return static_cast<void*>(&_M_storage); }

      const void*
      _M_addr() const noexcept
      { return static_cast<const void*>(&_M_storage); }

      _Tp*
      _M_ptr() noexcept
      { return static_cast<_Tp*>(_M_addr()); }

      const _Tp*
      _M_ptr() const noexcept
      { return static_cast<const _Tp*>(_M_addr()); }
    };
# 89 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/aligned_buffer.h" 3
  template<typename _Tp>
    struct __aligned_buffer
    : std::aligned_storage<sizeof(_Tp), __alignof__(_Tp)>
    {
      typename
 std::aligned_storage<sizeof(_Tp), __alignof__(_Tp)>::type _M_storage;

      __aligned_buffer() = default;


      __aligned_buffer(std::nullptr_t) { }

      void*
      _M_addr() noexcept
      {
        return static_cast<void*>(&_M_storage);
      }

      const void*
      _M_addr() const noexcept
      {
        return static_cast<const void*>(&_M_storage);
      }

      _Tp*
      _M_ptr() noexcept
      { return static_cast<_Tp*>(_M_addr()); }

      const _Tp*
      _M_ptr() const noexcept
      { return static_cast<const _Tp*>(_M_addr()); }
    };


}
# 43 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 1 3
# 69 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{
# 80 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
  struct piecewise_construct_t { explicit piecewise_construct_t() = default; };


                    constexpr piecewise_construct_t piecewise_construct =
    piecewise_construct_t();




  template<typename...>
    class tuple;

  template<size_t...>
    struct _Index_tuple;






  template <bool, typename _T1, typename _T2>
    struct _PCC
    {
      template <typename _U1, typename _U2>
      static constexpr bool _ConstructiblePair()
      {
 return __and_<is_constructible<_T1, const _U1&>,
        is_constructible<_T2, const _U2&>>::value;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyConvertiblePair()
      {
 return __and_<is_convertible<const _U1&, _T1>,
        is_convertible<const _U2&, _T2>>::value;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _MoveConstructiblePair()
      {
 return __and_<is_constructible<_T1, _U1&&>,
        is_constructible<_T2, _U2&&>>::value;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyMoveConvertiblePair()
      {
 return __and_<is_convertible<_U1&&, _T1>,
        is_convertible<_U2&&, _T2>>::value;
      }

      template <bool __implicit, typename _U1, typename _U2>
      static constexpr bool _CopyMovePair()
      {
 using __do_converts = __and_<is_convertible<const _U1&, _T1>,
      is_convertible<_U2&&, _T2>>;
 using __converts = typename conditional<__implicit,
           __do_converts,
           __not_<__do_converts>>::type;
 return __and_<is_constructible<_T1, const _U1&>,
        is_constructible<_T2, _U2&&>,
        __converts
        >::value;
      }

      template <bool __implicit, typename _U1, typename _U2>
      static constexpr bool _MoveCopyPair()
      {
 using __do_converts = __and_<is_convertible<_U1&&, _T1>,
      is_convertible<const _U2&, _T2>>;
 using __converts = typename conditional<__implicit,
           __do_converts,
           __not_<__do_converts>>::type;
 return __and_<is_constructible<_T1, _U1&&>,
        is_constructible<_T2, const _U2&&>,
        __converts
        >::value;
      }
  };

  template <typename _T1, typename _T2>
    struct _PCC<false, _T1, _T2>
    {
      template <typename _U1, typename _U2>
      static constexpr bool _ConstructiblePair()
      {
 return false;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyConvertiblePair()
      {
 return false;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _MoveConstructiblePair()
      {
 return false;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyMoveConvertiblePair()
      {
 return false;
      }
  };


  template<typename _U1, typename _U2> class __pair_base
  {

    template<typename _T1, typename _T2> friend struct pair;
    __pair_base() = default;
    ~__pair_base() = default;
    __pair_base(const __pair_base&) = default;
    __pair_base& operator=(const __pair_base&) = delete;

  };
# 210 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    struct pair
    : private __pair_base<_T1, _T2>
    {
      typedef _T1 first_type;
      typedef _T2 second_type;

      _T1 first;
      _T2 second;






      template <typename _U1 = _T1,
                typename _U2 = _T2,
                typename enable_if<__and_<
                                     __is_implicitly_default_constructible<_U1>,
                                     __is_implicitly_default_constructible<_U2>>
                                   ::value, bool>::type = true>

      constexpr pair()
      : first(), second() { }


      template <typename _U1 = _T1,
                typename _U2 = _T2,
                typename enable_if<__and_<
                       is_default_constructible<_U1>,
                       is_default_constructible<_U2>,
                       __not_<
                         __and_<__is_implicitly_default_constructible<_U1>,
                                __is_implicitly_default_constructible<_U2>>>>
                                   ::value, bool>::type = false>
      explicit constexpr pair()
      : first(), second() { }
# 256 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
      using _PCCP = _PCC<true, _T1, _T2>;



      template<typename _U1 = _T1, typename _U2=_T2, typename
        enable_if<_PCCP::template
      _ConstructiblePair<_U1, _U2>()
                  && _PCCP::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
      constexpr pair(const _T1& __a, const _T2& __b)
      : first(__a), second(__b) { }


       template<typename _U1 = _T1, typename _U2=_T2, typename
  enable_if<_PCCP::template
       _ConstructiblePair<_U1, _U2>()
                   && !_PCCP::template
       _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
      explicit constexpr pair(const _T1& __a, const _T2& __b)
      : first(__a), second(__b) { }
# 288 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
      template <typename _U1, typename _U2>
        using _PCCFP = _PCC<!is_same<_T1, _U1>::value
       || !is_same<_T2, _U2>::value,
       _T1, _T2>;


      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _ConstructiblePair<_U1, _U2>()
                  && _PCCFP<_U1, _U2>::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
     bool>::type=true>
        constexpr pair(const pair<_U1, _U2>& __p)
        : first(__p.first), second(__p.second) { }

      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _ConstructiblePair<_U1, _U2>()
    && !_PCCFP<_U1, _U2>::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(const pair<_U1, _U2>& __p)
 : first(__p.first), second(__p.second) { }



      constexpr pair(const pair&) = default;
      constexpr pair(pair&&) = default;


      template<typename _U1, typename
        enable_if<_PCCP::template
      _MoveCopyPair<true, _U1, _T2>(),
                         bool>::type=true>
       constexpr pair(_U1&& __x, const _T2& __y)
       : first(std::forward<_U1>(__x)), second(__y) { }

      template<typename _U1, typename
        enable_if<_PCCP::template
      _MoveCopyPair<false, _U1, _T2>(),
                         bool>::type=false>
       explicit constexpr pair(_U1&& __x, const _T2& __y)
       : first(std::forward<_U1>(__x)), second(__y) { }

      template<typename _U2, typename
        enable_if<_PCCP::template
      _CopyMovePair<true, _T1, _U2>(),
                         bool>::type=true>
       constexpr pair(const _T1& __x, _U2&& __y)
       : first(__x), second(std::forward<_U2>(__y)) { }

      template<typename _U2, typename
        enable_if<_PCCP::template
      _CopyMovePair<false, _T1, _U2>(),
                         bool>::type=false>
       explicit pair(const _T1& __x, _U2&& __y)
       : first(__x), second(std::forward<_U2>(__y)) { }

      template<typename _U1, typename _U2, typename
        enable_if<_PCCP::template
      _MoveConstructiblePair<_U1, _U2>()
     && _PCCP::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
 constexpr pair(_U1&& __x, _U2&& __y)
 : first(std::forward<_U1>(__x)), second(std::forward<_U2>(__y)) { }

      template<typename _U1, typename _U2, typename
        enable_if<_PCCP::template
      _MoveConstructiblePair<_U1, _U2>()
     && !_PCCP::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(_U1&& __x, _U2&& __y)
 : first(std::forward<_U1>(__x)), second(std::forward<_U2>(__y)) { }


      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _MoveConstructiblePair<_U1, _U2>()
     && _PCCFP<_U1, _U2>::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
 constexpr pair(pair<_U1, _U2>&& __p)
 : first(std::forward<_U1>(__p.first)),
   second(std::forward<_U2>(__p.second)) { }

      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _MoveConstructiblePair<_U1, _U2>()
     && !_PCCFP<_U1, _U2>::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(pair<_U1, _U2>&& __p)
 : first(std::forward<_U1>(__p.first)),
   second(std::forward<_U2>(__p.second)) { }

      template<typename... _Args1, typename... _Args2>

        pair(piecewise_construct_t, tuple<_Args1...>, tuple<_Args2...>);

                           pair&
      operator=(typename conditional<
  __and_<is_copy_assignable<_T1>,
         is_copy_assignable<_T2>>::value,
  const pair&, const __nonesuch&>::type __p)
      {
 first = __p.first;
 second = __p.second;
 return *this;
      }

                           pair&
      operator=(typename conditional<
  __and_<is_move_assignable<_T1>,
         is_move_assignable<_T2>>::value,
  pair&&, __nonesuch&&>::type __p)
      noexcept(__and_<is_nothrow_move_assignable<_T1>,
        is_nothrow_move_assignable<_T2>>::value)
      {
 first = std::forward<first_type>(__p.first);
 second = std::forward<second_type>(__p.second);
 return *this;
      }

      template<typename _U1, typename _U2>

 typename enable_if<__and_<is_assignable<_T1&, const _U1&>,
      is_assignable<_T2&, const _U2&>>::value,
      pair&>::type
 operator=(const pair<_U1, _U2>& __p)
 {
   first = __p.first;
   second = __p.second;
   return *this;
 }

      template<typename _U1, typename _U2>

 typename enable_if<__and_<is_assignable<_T1&, _U1&&>,
      is_assignable<_T2&, _U2&&>>::value,
      pair&>::type
 operator=(pair<_U1, _U2>&& __p)
 {
   first = std::forward<_U1>(__p.first);
   second = std::forward<_U2>(__p.second);
   return *this;
 }


                           void
      swap(pair& __p)
      noexcept(__and_<__is_nothrow_swappable<_T1>,
                      __is_nothrow_swappable<_T2>>::value)
      {
 using std::swap;
 swap(first, __p.first);
 swap(second, __p.second);
      }

    private:
      template<typename... _Args1, size_t... _Indexes1,
        typename... _Args2, size_t... _Indexes2>

        pair(tuple<_Args1...>&, tuple<_Args2...>&,
      _Index_tuple<_Indexes1...>, _Index_tuple<_Indexes2...>);

    };
# 464 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    inline constexpr bool
    operator==(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first == __y.first && __x.second == __y.second; }
# 487 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    inline constexpr bool
    operator<(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first < __y.first
      || (!(__y.first < __x.first) && __x.second < __y.second); }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator!=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x == __y); }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator>(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __y < __x; }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator<=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__y < __x); }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator>=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x < __y); }
# 524 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
                         inline





    void

    swap(pair<_T1, _T2>& __x, pair<_T1, _T2>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }
# 564 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    constexpr pair<typename __decay_and_strip<_T1>::__type,
                   typename __decay_and_strip<_T2>::__type>
    make_pair(_T1&& __x, _T2&& __y)
    {
      typedef typename __decay_and_strip<_T1>::__type __ds_type1;
      typedef typename __decay_and_strip<_T2>::__type __ds_type2;
      typedef pair<__ds_type1, __ds_type2> __pair_type;
      return __pair_type(std::forward<_T1>(__x), std::forward<_T2>(__y));
    }
# 584 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_pair.h" 3
}
# 44 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 1 3
# 63 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{
# 116 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
  template<typename _Arg, typename _Result>
    struct unary_function
    {

      typedef _Arg argument_type;


      typedef _Result result_type;
    };





  template<typename _Arg1, typename _Arg2, typename _Result>
    struct binary_function
    {

      typedef _Arg1 first_argument_type;


      typedef _Arg2 second_argument_type;


      typedef _Result result_type;
    };
# 179 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
  template<typename _Tp>
    struct plus : public binary_function<_Tp, _Tp, _Tp>
    {


      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x + __y; }
    };


  template<typename _Tp>
    struct minus : public binary_function<_Tp, _Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x - __y; }
    };


  template<typename _Tp>
    struct multiplies : public binary_function<_Tp, _Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x * __y; }
    };


  template<typename _Tp>
    struct divides : public binary_function<_Tp, _Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x / __y; }
    };


  template<typename _Tp>
    struct modulus : public binary_function<_Tp, _Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x % __y; }
    };


  template<typename _Tp>
    struct negate : public unary_function<_Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x) const
      { return -__x; }
    };
# 364 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
  template<typename _Tp>
    struct equal_to : public binary_function<_Tp, _Tp, bool>
    {

      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x == __y; }
    };


  template<typename _Tp>
    struct not_equal_to : public binary_function<_Tp, _Tp, bool>
    {

      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x != __y; }
    };


  template<typename _Tp>
    struct greater : public binary_function<_Tp, _Tp, bool>
    {

      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x > __y; }
    };


  template<typename _Tp>
    struct less : public binary_function<_Tp, _Tp, bool>
    {

      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x < __y; }
    };


  template<typename _Tp>
    struct greater_equal : public binary_function<_Tp, _Tp, bool>
    {

      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x >= __y; }
    };


  template<typename _Tp>
    struct less_equal : public binary_function<_Tp, _Tp, bool>
    {

      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x <= __y; }
    };


  template<typename _Tp>
    struct greater<_Tp*> : public binary_function<_Tp*, _Tp*, bool>
    {
                           bool
      operator()(_Tp* __x, _Tp* __y) const noexcept
      {
# 438 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
 return (long unsigned int)__x > (long unsigned int)__y;
      }
    };


  template<typename _Tp>
    struct less<_Tp*> : public binary_function<_Tp*, _Tp*, bool>
    {
                           bool
      operator()(_Tp* __x, _Tp* __y) const noexcept
      {
# 457 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
 return (long unsigned int)__x < (long unsigned int)__y;
      }
    };


  template<typename _Tp>
    struct greater_equal<_Tp*> : public binary_function<_Tp*, _Tp*, bool>
    {
                           bool
      operator()(_Tp* __x, _Tp* __y) const noexcept
      {
# 476 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
 return (long unsigned int)__x >= (long unsigned int)__y;
      }
    };


  template<typename _Tp>
    struct less_equal<_Tp*> : public binary_function<_Tp*, _Tp*, bool>
    {
                           bool
      operator()(_Tp* __x, _Tp* __y) const noexcept
      {
# 495 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
 return (long unsigned int)__x <= (long unsigned int)__y;
      }
    };
# 799 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
  template<typename _Tp>
    struct logical_and : public binary_function<_Tp, _Tp, bool>
    {

      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x && __y; }
    };


  template<typename _Tp>
    struct logical_or : public binary_function<_Tp, _Tp, bool>
    {

      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x || __y; }
    };


  template<typename _Tp>
    struct logical_not : public unary_function<_Tp, bool>
    {

      bool
      operator()(const _Tp& __x) const
      { return !__x; }
    };
# 892 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
  template<typename _Tp>
    struct bit_and : public binary_function<_Tp, _Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x & __y; }
    };

  template<typename _Tp>
    struct bit_or : public binary_function<_Tp, _Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x | __y; }
    };

  template<typename _Tp>
    struct bit_xor : public binary_function<_Tp, _Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x ^ __y; }
    };

  template<typename _Tp>
    struct bit_not : public unary_function<_Tp, _Tp>
    {

      _Tp
      operator()(const _Tp& __x) const
      { return ~__x; }
    };
# 1019 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
  template<typename _Predicate>
    class unary_negate
    : public unary_function<typename _Predicate::argument_type, bool>
    {
    protected:
      _Predicate _M_pred;

    public:

      explicit
      unary_negate(const _Predicate& __x) : _M_pred(__x) { }


      bool
      operator()(const typename _Predicate::argument_type& __x) const
      { return !_M_pred(__x); }
    };


  template<typename _Predicate>

    inline unary_negate<_Predicate>
    not1(const _Predicate& __pred)
    { return unary_negate<_Predicate>(__pred); }


  template<typename _Predicate>
    class binary_negate
    : public binary_function<typename _Predicate::first_argument_type,
        typename _Predicate::second_argument_type, bool>
    {
    protected:
      _Predicate _M_pred;

    public:

      explicit
      binary_negate(const _Predicate& __x) : _M_pred(__x) { }


      bool
      operator()(const typename _Predicate::first_argument_type& __x,
   const typename _Predicate::second_argument_type& __y) const
      { return !_M_pred(__x, __y); }
    };


  template<typename _Predicate>

    inline binary_negate<_Predicate>
    not2(const _Predicate& __pred)
    { return binary_negate<_Predicate>(__pred); }
# 1098 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
  template<typename _Arg, typename _Result>
    class pointer_to_unary_function : public unary_function<_Arg, _Result>
    {
    protected:
      _Result (*_M_ptr)(_Arg);

    public:
      pointer_to_unary_function() { }

      explicit
      pointer_to_unary_function(_Result (*__x)(_Arg))
      : _M_ptr(__x) { }

      _Result
      operator()(_Arg __x) const
      { return _M_ptr(__x); }
    };


  template<typename _Arg, typename _Result>
    inline pointer_to_unary_function<_Arg, _Result>
    ptr_fun(_Result (*__x)(_Arg))
    { return pointer_to_unary_function<_Arg, _Result>(__x); }


  template<typename _Arg1, typename _Arg2, typename _Result>
    class pointer_to_binary_function
    : public binary_function<_Arg1, _Arg2, _Result>
    {
    protected:
      _Result (*_M_ptr)(_Arg1, _Arg2);

    public:
      pointer_to_binary_function() { }

      explicit
      pointer_to_binary_function(_Result (*__x)(_Arg1, _Arg2))
      : _M_ptr(__x) { }

      _Result
      operator()(_Arg1 __x, _Arg2 __y) const
      { return _M_ptr(__x, __y); }
    };


  template<typename _Arg1, typename _Arg2, typename _Result>
    inline pointer_to_binary_function<_Arg1, _Arg2, _Result>
    ptr_fun(_Result (*__x)(_Arg1, _Arg2))
    { return pointer_to_binary_function<_Arg1, _Arg2, _Result>(__x); }


  template<typename _Tp>
    struct _Identity
    : public unary_function<_Tp, _Tp>
    {
      _Tp&
      operator()(_Tp& __x) const
      { return __x; }

      const _Tp&
      operator()(const _Tp& __x) const
      { return __x; }
    };


  template<typename _Tp> struct _Identity<const _Tp> : _Identity<_Tp> { };

  template<typename _Pair>
    struct _Select1st
    : public unary_function<_Pair, typename _Pair::first_type>
    {
      typename _Pair::first_type&
      operator()(_Pair& __x) const
      { return __x.first; }

      const typename _Pair::first_type&
      operator()(const _Pair& __x) const
      { return __x.first; }


      template<typename _Pair2>
        typename _Pair2::first_type&
        operator()(_Pair2& __x) const
        { return __x.first; }

      template<typename _Pair2>
        const typename _Pair2::first_type&
        operator()(const _Pair2& __x) const
        { return __x.first; }

    };

  template<typename _Pair>
    struct _Select2nd
    : public unary_function<_Pair, typename _Pair::second_type>
    {
      typename _Pair::second_type&
      operator()(_Pair& __x) const
      { return __x.second; }

      const typename _Pair::second_type&
      operator()(const _Pair& __x) const
      { return __x.second; }
    };
# 1223 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
  template<typename _Ret, typename _Tp>
    class mem_fun_t : public unary_function<_Tp*, _Ret>
    {
    public:
      explicit
      mem_fun_t(_Ret (_Tp::*__pf)())
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp* __p) const
      { return (__p->*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)();
    };


  template<typename _Ret, typename _Tp>
    class const_mem_fun_t : public unary_function<const _Tp*, _Ret>
    {
    public:
      explicit
      const_mem_fun_t(_Ret (_Tp::*__pf)() const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp* __p) const
      { return (__p->*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)() const;
    };


  template<typename _Ret, typename _Tp>
    class mem_fun_ref_t : public unary_function<_Tp, _Ret>
    {
    public:
      explicit
      mem_fun_ref_t(_Ret (_Tp::*__pf)())
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp& __r) const
      { return (__r.*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)();
  };


  template<typename _Ret, typename _Tp>
    class const_mem_fun_ref_t : public unary_function<_Tp, _Ret>
    {
    public:
      explicit
      const_mem_fun_ref_t(_Ret (_Tp::*__pf)() const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp& __r) const
      { return (__r.*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)() const;
    };


  template<typename _Ret, typename _Tp, typename _Arg>
    class mem_fun1_t : public binary_function<_Tp*, _Arg, _Ret>
    {
    public:
      explicit
      mem_fun1_t(_Ret (_Tp::*__pf)(_Arg))
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp* __p, _Arg __x) const
      { return (__p->*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg);
    };


  template<typename _Ret, typename _Tp, typename _Arg>
    class const_mem_fun1_t : public binary_function<const _Tp*, _Arg, _Ret>
    {
    public:
      explicit
      const_mem_fun1_t(_Ret (_Tp::*__pf)(_Arg) const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp* __p, _Arg __x) const
      { return (__p->*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg) const;
    };


  template<typename _Ret, typename _Tp, typename _Arg>
    class mem_fun1_ref_t : public binary_function<_Tp, _Arg, _Ret>
    {
    public:
      explicit
      mem_fun1_ref_t(_Ret (_Tp::*__pf)(_Arg))
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp& __r, _Arg __x) const
      { return (__r.*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg);
    };


  template<typename _Ret, typename _Tp, typename _Arg>
    class const_mem_fun1_ref_t : public binary_function<_Tp, _Arg, _Ret>
    {
    public:
      explicit
      const_mem_fun1_ref_t(_Ret (_Tp::*__pf)(_Arg) const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp& __r, _Arg __x) const
      { return (__r.*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg) const;
    };



  template<typename _Ret, typename _Tp>
    inline mem_fun_t<_Ret, _Tp>
    mem_fun(_Ret (_Tp::*__f)())
    { return mem_fun_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline const_mem_fun_t<_Ret, _Tp>
    mem_fun(_Ret (_Tp::*__f)() const)
    { return const_mem_fun_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline mem_fun_ref_t<_Ret, _Tp>
    mem_fun_ref(_Ret (_Tp::*__f)())
    { return mem_fun_ref_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline const_mem_fun_ref_t<_Ret, _Tp>
    mem_fun_ref(_Ret (_Tp::*__f)() const)
    { return const_mem_fun_ref_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline mem_fun1_t<_Ret, _Tp, _Arg>
    mem_fun(_Ret (_Tp::*__f)(_Arg))
    { return mem_fun1_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline const_mem_fun1_t<_Ret, _Tp, _Arg>
    mem_fun(_Ret (_Tp::*__f)(_Arg) const)
    { return const_mem_fun1_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline mem_fun1_ref_t<_Ret, _Tp, _Arg>
    mem_fun_ref(_Ret (_Tp::*__f)(_Arg))
    { return mem_fun1_ref_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline const_mem_fun1_ref_t<_Ret, _Tp, _Arg>
    mem_fun_ref(_Ret (_Tp::*__f)(_Arg) const)
    { return const_mem_fun1_ref_t<_Ret, _Tp, _Arg>(__f); }
# 1418 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 3
}



# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/backward/binders.h" 1 3
# 60 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/backward/binders.h" 3
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"

namespace std __attribute__ ((__visibility__ ("default")))
{
# 107 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/backward/binders.h" 3
  template<typename _Operation>
    class binder1st
    : public unary_function<typename _Operation::second_argument_type,
       typename _Operation::result_type>
    {
    protected:
      _Operation op;
      typename _Operation::first_argument_type value;

    public:
      binder1st(const _Operation& __x,
  const typename _Operation::first_argument_type& __y)
      : op(__x), value(__y) { }

      typename _Operation::result_type
      operator()(const typename _Operation::second_argument_type& __x) const
      { return op(value, __x); }



      typename _Operation::result_type
      operator()(typename _Operation::second_argument_type& __x) const
      { return op(value, __x); }
    } __attribute__ ((__deprecated__ ("use '" "std::bind" "' instead")));


  template<typename _Operation, typename _Tp>
    inline binder1st<_Operation>
    bind1st(const _Operation& __fn, const _Tp& __x)
    {
      typedef typename _Operation::first_argument_type _Arg1_type;
      return binder1st<_Operation>(__fn, _Arg1_type(__x));
    }


  template<typename _Operation>
    class binder2nd
    : public unary_function<typename _Operation::first_argument_type,
       typename _Operation::result_type>
    {
    protected:
      _Operation op;
      typename _Operation::second_argument_type value;

    public:
      binder2nd(const _Operation& __x,
  const typename _Operation::second_argument_type& __y)
      : op(__x), value(__y) { }

      typename _Operation::result_type
      operator()(const typename _Operation::first_argument_type& __x) const
      { return op(__x, value); }



      typename _Operation::result_type
      operator()(typename _Operation::first_argument_type& __x) const
      { return op(__x, value); }
    } __attribute__ ((__deprecated__ ("use '" "std::bind" "' instead")));


  template<typename _Operation, typename _Tp>
    inline binder2nd<_Operation>
    bind2nd(const _Operation& __fn, const _Tp& __x)
    {
      typedef typename _Operation::second_argument_type _Arg2_type;
      return binder2nd<_Operation>(__fn, _Arg2_type(__x));
    }



}

#pragma GCC diagnostic pop
# 1422 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_function.h" 2 3
# 45 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functional_hash.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functional_hash.h" 3


# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hash_bytes.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hash_bytes.h" 3



namespace std
{







  size_t
  _Hash_bytes(const void* __ptr, size_t __len, size_t __seed);





  size_t
  _Fnv_hash_bytes(const void* __ptr, size_t __len, size_t __seed);


}
# 37 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functional_hash.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{
# 50 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functional_hash.h" 3
  template<typename _Result, typename _Arg>
    struct __hash_base
    {
      typedef _Result result_type ;
      typedef _Arg argument_type ;
    };


  template<typename _Tp>
    struct hash;

  template<typename _Tp, typename = void>
    struct __poison_hash
    {
      static constexpr bool __enable_hash_call = false;
    private:

      __poison_hash(__poison_hash&&);
      ~__poison_hash();
    };

  template<typename _Tp>
    struct __poison_hash<_Tp, __void_t<decltype(hash<_Tp>()(declval<_Tp>()))>>
    {
      static constexpr bool __enable_hash_call = true;
    };


  template<typename _Tp, bool = is_enum<_Tp>::value>
    struct __hash_enum
    {
    private:

      __hash_enum(__hash_enum&&);
      ~__hash_enum();
    };


  template<typename _Tp>
    struct __hash_enum<_Tp, true> : public __hash_base<size_t, _Tp>
    {
      size_t
      operator()(_Tp __val) const noexcept
      {
       using __type = typename underlying_type<_Tp>::type;
       return hash<__type>{}(static_cast<__type>(__val));
      }
    };



  template<typename _Tp>
    struct hash : __hash_enum<_Tp>
    { };


  template<typename _Tp>
    struct hash<_Tp*> : public __hash_base<size_t, _Tp*>
    {
      size_t
      operator()(_Tp* __p) const noexcept
      { return reinterpret_cast<size_t>(__p); }
    };
# 125 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functional_hash.h" 3
  template<> struct hash<bool> : public __hash_base<size_t, bool> { size_t operator()(bool __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<char> : public __hash_base<size_t, char> { size_t operator()(char __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<signed char> : public __hash_base<size_t, signed char> { size_t operator()(signed char __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<unsigned char> : public __hash_base<size_t, unsigned char> { size_t operator()(unsigned char __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<wchar_t> : public __hash_base<size_t, wchar_t> { size_t operator()(wchar_t __val) const noexcept { return static_cast<size_t>(__val); } };







  template<> struct hash<char16_t> : public __hash_base<size_t, char16_t> { size_t operator()(char16_t __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<char32_t> : public __hash_base<size_t, char32_t> { size_t operator()(char32_t __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<short> : public __hash_base<size_t, short> { size_t operator()(short __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<int> : public __hash_base<size_t, int> { size_t operator()(int __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<long> : public __hash_base<size_t, long> { size_t operator()(long __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<long long> : public __hash_base<size_t, long long> { size_t operator()(long long __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<unsigned short> : public __hash_base<size_t, unsigned short> { size_t operator()(unsigned short __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<unsigned int> : public __hash_base<size_t, unsigned int> { size_t operator()(unsigned int __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<unsigned long> : public __hash_base<size_t, unsigned long> { size_t operator()(unsigned long __val) const noexcept { return static_cast<size_t>(__val); } };


  template<> struct hash<unsigned long long> : public __hash_base<size_t, unsigned long long> { size_t operator()(unsigned long long __val) const noexcept { return static_cast<size_t>(__val); } };
# 193 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functional_hash.h" 3
  struct _Hash_impl
  {
    static size_t
    hash(const void* __ptr, size_t __clength,
  size_t __seed = static_cast<size_t>(0xc70f6907UL))
    { return _Hash_bytes(__ptr, __clength, __seed); }

    template<typename _Tp>
      static size_t
      hash(const _Tp& __val)
      { return hash(&__val, sizeof(__val)); }

    template<typename _Tp>
      static size_t
      __hash_combine(const _Tp& __val, size_t __hash)
      { return hash(&__val, sizeof(__val), __hash); }
  };


  struct _Fnv_hash_impl
  {
    static size_t
    hash(const void* __ptr, size_t __clength,
  size_t __seed = static_cast<size_t>(2166136261UL))
    { return _Fnv_hash_bytes(__ptr, __clength, __seed); }

    template<typename _Tp>
      static size_t
      hash(const _Tp& __val)
      { return hash(&__val, sizeof(__val)); }

    template<typename _Tp>
      static size_t
      __hash_combine(const _Tp& __val, size_t __hash)
      { return hash(&__val, sizeof(__val), __hash); }
  };


  template<>
    struct hash<float> : public __hash_base<size_t, float>
    {
      size_t
      operator()(float __val) const noexcept
      {

 return __val != 0.0f ? std::_Hash_impl::hash(__val) : 0;
      }
    };


  template<>
    struct hash<double> : public __hash_base<size_t, double>
    {
      size_t
      operator()(double __val) const noexcept
      {

 return __val != 0.0 ? std::_Hash_impl::hash(__val) : 0;
      }
    };


  template<>
    struct hash<long double>
    : public __hash_base<size_t, long double>
    {
      __attribute__ ((__pure__)) size_t
      operator()(long double __val) const noexcept;
    };
# 279 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functional_hash.h" 3
  template<typename _Hash>
    struct __is_fast_hash : public std::true_type
    { };

  template<>
    struct __is_fast_hash<hash<long double>> : public std::false_type
    { };


}
# 46 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 3

# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3





# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility" 1 3
# 59 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility" 3
# 69 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_relops.h" 1 3
# 67 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_relops.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  namespace rel_ops
  {
# 85 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_relops.h" 3
    template <class _Tp>
      inline bool
      operator!=(const _Tp& __x, const _Tp& __y)
      { return !(__x == __y); }
# 98 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_relops.h" 3
    template <class _Tp>
      inline bool
      operator>(const _Tp& __x, const _Tp& __y)
      { return __y < __x; }
# 111 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_relops.h" 3
    template <class _Tp>
      inline bool
      operator<=(const _Tp& __x, const _Tp& __y)
      { return !(__y < __x); }
# 124 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_relops.h" 3
    template <class _Tp>
      inline bool
      operator>=(const _Tp& __x, const _Tp& __y)
      { return !(__x < __y); }
  }


}
# 70 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility" 2 3
# 82 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility" 3
namespace std __attribute__ ((__visibility__ ("default")))
{



  template<typename _Tp>
    struct tuple_size;





  template<typename _Tp,
    typename _Up = typename remove_cv<_Tp>::type,
    typename = typename enable_if<is_same<_Tp, _Up>::value>::type,
    size_t = tuple_size<_Tp>::value>
    using __enable_if_has_tuple_size = _Tp;

  template<typename _Tp>
    struct tuple_size<const __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };

  template<typename _Tp>
    struct tuple_size<volatile __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };

  template<typename _Tp>
    struct tuple_size<const volatile __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };


  template<size_t __i, typename _Tp>
    struct tuple_element;


  template<size_t __i, typename _Tp>
    using __tuple_element_t = typename tuple_element<__i, _Tp>::type;

  template<size_t __i, typename _Tp>
    struct tuple_element<__i, const _Tp>
    {
      typedef typename add_const<__tuple_element_t<__i, _Tp>>::type type;
    };

  template<size_t __i, typename _Tp>
    struct tuple_element<__i, volatile _Tp>
    {
      typedef typename add_volatile<__tuple_element_t<__i, _Tp>>::type type;
    };

  template<size_t __i, typename _Tp>
    struct tuple_element<__i, const volatile _Tp>
    {
      typedef typename add_cv<__tuple_element_t<__i, _Tp>>::type type;
    };
# 151 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility" 3
  template<typename _T1, typename _T2>
    struct __is_tuple_like_impl<pair<_T1, _T2>> : true_type
    { };


  template<class _Tp1, class _Tp2>
    struct tuple_size<pair<_Tp1, _Tp2>>
    : public integral_constant<size_t, 2> { };


  template<class _Tp1, class _Tp2>
    struct tuple_element<0, pair<_Tp1, _Tp2>>
    { typedef _Tp1 type; };


  template<class _Tp1, class _Tp2>
    struct tuple_element<1, pair<_Tp1, _Tp2>>
    { typedef _Tp2 type; };

  template<size_t _Int>
    struct __pair_get;

  template<>
    struct __pair_get<0>
    {
      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp1&
 __get(pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.first; }

      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp1&&
 __move_get(pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<_Tp1>(__pair.first); }

      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp1&
 __const_get(const pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.first; }

      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp1&&
 __const_move_get(const pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<const _Tp1>(__pair.first); }
    };

  template<>
    struct __pair_get<1>
    {
      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp2&
 __get(pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.second; }

      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp2&&
 __move_get(pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<_Tp2>(__pair.second); }

      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp2&
 __const_get(const pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.second; }

      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp2&&
 __const_move_get(const pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<const _Tp2>(__pair.second); }
    };

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&
    get(pair<_Tp1, _Tp2>& __in) noexcept
    { return __pair_get<_Int>::__get(__in); }

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&&
    get(pair<_Tp1, _Tp2>&& __in) noexcept
    { return __pair_get<_Int>::__move_get(std::move(__in)); }

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr const typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&
    get(const pair<_Tp1, _Tp2>& __in) noexcept
    { return __pair_get<_Int>::__const_get(__in); }

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr const typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&&
    get(const pair<_Tp1, _Tp2>&& __in) noexcept
    { return __pair_get<_Int>::__const_move_get(std::move(__in)); }
# 298 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility" 3
  template<size_t... _Indexes> struct _Index_tuple { };


  template<size_t _Num>
    struct _Build_index_tuple
    {

      template<typename, size_t... _Indices>
        using _IdxTuple = _Index_tuple<_Indices...>;


      using __type = __make_integer_seq<_IdxTuple, size_t, _Num>;




    };
# 477 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility" 3
}
# 39 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 3







# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 1 3
# 67 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 1 3
# 88 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{
# 127 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Iterator>
    class reverse_iterator
    : public iterator<typename iterator_traits<_Iterator>::iterator_category,
        typename iterator_traits<_Iterator>::value_type,
        typename iterator_traits<_Iterator>::difference_type,
        typename iterator_traits<_Iterator>::pointer,
                      typename iterator_traits<_Iterator>::reference>
    {
      template<typename _Iter>
 friend class reverse_iterator;
# 146 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
    protected:
      _Iterator current;

      typedef iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::pointer pointer;

      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::reference reference;
# 178 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
      reverse_iterator() : current() { }




      explicit
      reverse_iterator(iterator_type __x) : current(__x) { }





      reverse_iterator(const reverse_iterator& __x)
      : current(__x.current) { }


      reverse_iterator& operator=(const reverse_iterator&) = default;






      template<typename _Iter>




        reverse_iterator(const reverse_iterator<_Iter>& __x)
 : current(__x.current) { }


      template<typename _Iter>





 reverse_iterator&
 operator=(const reverse_iterator<_Iter>& __x)
 {
   current = __x.current;
   return *this;
 }





                           iterator_type
      base() const
      { return current; }
# 241 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
                           reference
      operator*() const
      {
 _Iterator __tmp = current;
 return *--__tmp;
      }






                           pointer
      operator->() const




      {


 _Iterator __tmp = current;
 --__tmp;
 return _S_to_pointer(__tmp);
      }






                           reverse_iterator&
      operator++()
      {
 --current;
 return *this;
      }






                           reverse_iterator
      operator++(int)
      {
 reverse_iterator __tmp = *this;
 --current;
 return __tmp;
      }






                           reverse_iterator&
      operator--()
      {
 ++current;
 return *this;
      }






                           reverse_iterator
      operator--(int)
      {
 reverse_iterator __tmp = *this;
 ++current;
 return __tmp;
      }






                           reverse_iterator
      operator+(difference_type __n) const
      { return reverse_iterator(current - __n); }







                           reverse_iterator&
      operator+=(difference_type __n)
      {
 current -= __n;
 return *this;
      }






                           reverse_iterator
      operator-(difference_type __n) const
      { return reverse_iterator(current + __n); }







                           reverse_iterator&
      operator-=(difference_type __n)
      {
 current += __n;
 return *this;
      }






                           reference
      operator[](difference_type __n) const
      { return *(*this + __n); }
# 395 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
    private:
      template<typename _Tp>
 static _Tp*
 _S_to_pointer(_Tp* __p)
        { return __p; }

      template<typename _Tp>
 static pointer
 _S_to_pointer(_Tp __t)
        { return __t.operator->(); }
    };
# 418 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Iterator>
    inline bool
    operator==(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }

  template<typename _Iterator>
    inline bool
    operator<(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y.base() < __x.base(); }

  template<typename _Iterator>
    inline bool
    operator!=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x == __y); }

  template<typename _Iterator>
    inline bool
    operator>(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y < __x; }

  template<typename _Iterator>
    inline bool
    operator<=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__y < __x); }

  template<typename _Iterator>
    inline bool
    operator>=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x < __y); }




  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator==(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() == __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator<(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __x.base() > __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator!=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() != __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator>(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __x.base() < __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator<=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() >= __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator>=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() <= __y.base(); }
# 575 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR>
    inline auto
    operator-(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    -> decltype(__y.base() - __x.base())
    { return __y.base() - __x.base(); }


  template<typename _Iterator>
    inline reverse_iterator<_Iterator>
    operator+(typename reverse_iterator<_Iterator>::difference_type __n,
       const reverse_iterator<_Iterator>& __x)
    { return reverse_iterator<_Iterator>(__x.base() - __n); }



  template<typename _Iterator>
    inline reverse_iterator<_Iterator>
    __make_reverse_iterator(_Iterator __i)
    { return reverse_iterator<_Iterator>(__i); }
# 616 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Iterator>

    auto
    __niter_base(reverse_iterator<_Iterator> __it)
    -> decltype(__make_reverse_iterator(__niter_base(__it.base())))
    { return __make_reverse_iterator(__niter_base(__it.base())); }

  template<typename _Iterator>
    struct __is_move_iterator<reverse_iterator<_Iterator> >
      : __is_move_iterator<_Iterator>
    { };

  template<typename _Iterator>

    auto
    __miter_base(reverse_iterator<_Iterator> __it)
    -> decltype(__make_reverse_iterator(__miter_base(__it.base())))
    { return __make_reverse_iterator(__miter_base(__it.base())); }
# 647 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Container>
    class back_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;







      explicit
      back_insert_iterator(_Container& __x)
      : container(std::__addressof(__x)) { }
# 688 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
      back_insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 container->push_back(__value);
 return *this;
      }


      back_insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 container->push_back(std::move(__value));
 return *this;
      }




      back_insert_iterator&
      operator*()
      { return *this; }



      back_insert_iterator&
      operator++()
      { return *this; }



      back_insert_iterator
      operator++(int)
      { return *this; }
    };
# 734 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Container>

    inline back_insert_iterator<_Container>
    back_inserter(_Container& __x)
    { return back_insert_iterator<_Container>(__x); }
# 750 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Container>
    class front_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;







      explicit
      front_insert_iterator(_Container& __x)
      : container(std::__addressof(__x)) { }
# 791 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
      front_insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 container->push_front(__value);
 return *this;
      }


      front_insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 container->push_front(std::move(__value));
 return *this;
      }




      front_insert_iterator&
      operator*()
      { return *this; }



      front_insert_iterator&
      operator++()
      { return *this; }



      front_insert_iterator
      operator++(int)
      { return *this; }
    };
# 837 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Container>

    inline front_insert_iterator<_Container>
    front_inserter(_Container& __x)
    { return front_insert_iterator<_Container>(__x); }
# 857 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Container>
    class insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {







      typedef typename _Container::iterator _Iter;

    protected:
      _Container* container;
      _Iter iter;


    public:

      typedef _Container container_type;
# 890 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
      insert_iterator(_Container& __x, _Iter __i)
      : container(std::__addressof(__x)), iter(__i) {}
# 926 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
      insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 iter = container->insert(iter, __value);
 ++iter;
 return *this;
      }


      insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 iter = container->insert(iter, std::move(__value));
 ++iter;
 return *this;
      }




      insert_iterator&
      operator*()
      { return *this; }



      insert_iterator&
      operator++()
      { return *this; }



      insert_iterator&
      operator++(int)
      { return *this; }
    };
# 981 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Container>
    inline insert_iterator<_Container>
    inserter(_Container& __x, typename _Container::iterator __i)
    { return insert_iterator<_Container>(__x, __i); }





}

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{
# 1003 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Iterator, typename _Container>
    class __normal_iterator
    {
    protected:
      _Iterator _M_current;

      typedef std::iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::reference reference;
      typedef typename __traits_type::pointer pointer;





      constexpr __normal_iterator() noexcept
      : _M_current(_Iterator()) { }

      explicit
      __normal_iterator(const _Iterator& __i) noexcept
      : _M_current(__i) { }


      template<typename _Iter>

        __normal_iterator(const __normal_iterator<_Iter,
     typename __enable_if<
              (std::__are_same<_Iter, typename _Container::pointer>::__value),
        _Container>::__type>& __i) noexcept
        : _M_current(__i.base()) { }



      reference
      operator*() const noexcept
      { return *_M_current; }


      pointer
      operator->() const noexcept
      { return _M_current; }


      __normal_iterator&
      operator++() noexcept
      {
 ++_M_current;
 return *this;
      }


      __normal_iterator
      operator++(int) noexcept
      { return __normal_iterator(_M_current++); }



      __normal_iterator&
      operator--() noexcept
      {
 --_M_current;
 return *this;
      }


      __normal_iterator
      operator--(int) noexcept
      { return __normal_iterator(_M_current--); }



      reference
      operator[](difference_type __n) const noexcept
      { return _M_current[__n]; }


      __normal_iterator&
      operator+=(difference_type __n) noexcept
      { _M_current += __n; return *this; }


      __normal_iterator
      operator+(difference_type __n) const noexcept
      { return __normal_iterator(_M_current + __n); }


      __normal_iterator&
      operator-=(difference_type __n) noexcept
      { _M_current -= __n; return *this; }


      __normal_iterator
      operator-(difference_type __n) const noexcept
      { return __normal_iterator(_M_current - __n); }


      const _Iterator&
      base() const noexcept
      { return _M_current; }
    };
# 1152 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR, typename _Container>

    inline bool
    operator==(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() == __rhs.base(); }

  template<typename _Iterator, typename _Container>

    inline bool
    operator==(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() == __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>

    inline bool
    operator!=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() != __rhs.base(); }

  template<typename _Iterator, typename _Container>

    inline bool
    operator!=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() != __rhs.base(); }


  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() < __rhs.base(); }

  template<typename _Iterator, typename _Container>

    inline bool
    operator<(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() < __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() > __rhs.base(); }

  template<typename _Iterator, typename _Container>

    inline bool
    operator>(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() > __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() <= __rhs.base(); }

  template<typename _Iterator, typename _Container>

    inline bool
    operator<=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() <= __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() >= __rhs.base(); }

  template<typename _Iterator, typename _Container>

    inline bool
    operator>=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() >= __rhs.base(); }






  template<typename _IteratorL, typename _IteratorR, typename _Container>



    inline auto
    operator-(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs) noexcept
    -> decltype(__lhs.base() - __rhs.base())





    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>

    inline typename __normal_iterator<_Iterator, _Container>::difference_type
    operator-(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>

    inline __normal_iterator<_Iterator, _Container>
    operator+(typename __normal_iterator<_Iterator, _Container>::difference_type
       __n, const __normal_iterator<_Iterator, _Container>& __i)
    noexcept
    { return __normal_iterator<_Iterator, _Container>(__i.base() + __n); }


}

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _Iterator, typename _Container>

    _Iterator
    __niter_base(__gnu_cxx::__normal_iterator<_Iterator, _Container> __it)
    noexcept(std::is_nothrow_copy_constructible<_Iterator>::value)
    { return __it.base(); }
# 1342 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  namespace __detail
  {
# 1358 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  }
# 1369 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Iterator>
    class move_iterator



    {
      _Iterator _M_current;

      using __traits_type = iterator_traits<_Iterator>;

      using __base_ref = typename __traits_type::reference;


      template<typename _Iter2>
 friend class move_iterator;
# 1408 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
    public:
      using iterator_type = _Iterator;
# 1422 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;

      typedef _Iterator pointer;


      typedef typename conditional<is_reference<__base_ref>::value,
    typename remove_reference<__base_ref>::type&&,
    __base_ref>::type reference;



      move_iterator()
      : _M_current() { }

      explicit
      move_iterator(iterator_type __i)
      : _M_current(std::move(__i)) { }

      template<typename _Iter>




 move_iterator(const move_iterator<_Iter>& __i)
 : _M_current(__i._M_current) { }

      template<typename _Iter>





 move_iterator& operator=(const move_iterator<_Iter>& __i)
 {
   _M_current = __i._M_current;
   return *this;
 }


                           iterator_type
      base() const
      { return _M_current; }
# 1476 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
                           reference
      operator*() const



      { return static_cast<reference>(*_M_current); }


                           pointer
      operator->() const
      { return _M_current; }

                           move_iterator&
      operator++()
      {
 ++_M_current;
 return *this;
      }

                           move_iterator
      operator++(int)
      {
 move_iterator __tmp = *this;
 ++_M_current;
 return __tmp;
      }







                           move_iterator&
      operator--()
      {
 --_M_current;
 return *this;
      }

                           move_iterator
      operator--(int)
      {
 move_iterator __tmp = *this;
 --_M_current;
 return __tmp;
      }

                           move_iterator
      operator+(difference_type __n) const
      { return move_iterator(_M_current + __n); }

                           move_iterator&
      operator+=(difference_type __n)
      {
 _M_current += __n;
 return *this;
      }

                           move_iterator
      operator-(difference_type __n) const
      { return move_iterator(_M_current - __n); }

                           move_iterator&
      operator-=(difference_type __n)
      {
 _M_current -= __n;
 return *this;
      }

                           reference
      operator[](difference_type __n) const



      { return std::move(_M_current[__n]); }
# 1581 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
    };

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator==(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)



    { return __x.base() == __y.base(); }
# 1600 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator!=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return !(__x == __y); }


  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator<(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)



    { return __x.base() < __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator<=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)



    { return !(__y < __x); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator>(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)



    { return __y < __x; }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator>=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)



    { return !(__x < __y); }




  template<typename _Iterator>
    inline bool
    operator==(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }
# 1659 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Iterator>
    inline bool
    operator!=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__x == __y); }

  template<typename _Iterator>
    inline bool
    operator<(const move_iterator<_Iterator>& __x,
       const move_iterator<_Iterator>& __y)
    { return __x.base() < __y.base(); }

  template<typename _Iterator>
    inline bool
    operator<=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__y < __x); }

  template<typename _Iterator>
    inline bool
    operator>(const move_iterator<_Iterator>& __x,
       const move_iterator<_Iterator>& __y)
    { return __y < __x; }

  template<typename _Iterator>
    inline bool
    operator>=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__x < __y); }



  template<typename _IteratorL, typename _IteratorR>
    inline auto
    operator-(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)
    -> decltype(__x.base() - __y.base())
    { return __x.base() - __y.base(); }

  template<typename _Iterator>
    inline move_iterator<_Iterator>
    operator+(typename move_iterator<_Iterator>::difference_type __n,
       const move_iterator<_Iterator>& __x)
    { return __x + __n; }

  template<typename _Iterator>
    inline move_iterator<_Iterator>
    make_move_iterator(_Iterator __i)
    { return move_iterator<_Iterator>(std::move(__i)); }

  template<typename _Iterator, typename _ReturnType
    = typename conditional<__move_if_noexcept_cond
      <typename iterator_traits<_Iterator>::value_type>::value,
                _Iterator, move_iterator<_Iterator>>::type>
    inline _ReturnType
    __make_move_if_noexcept_iterator(_Iterator __i)
    { return _ReturnType(__i); }



  template<typename _Tp, typename _ReturnType
    = typename conditional<__move_if_noexcept_cond<_Tp>::value,
      const _Tp*, move_iterator<_Tp*>>::type>
    inline _ReturnType
    __make_move_if_noexcept_iterator(_Tp* __i)
    { return _ReturnType(__i); }
# 2447 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
  template<typename _Iterator>

    auto
    __niter_base(move_iterator<_Iterator> __it)
    -> decltype(make_move_iterator(__niter_base(__it.base())))
    { return make_move_iterator(__niter_base(__it.base())); }

  template<typename _Iterator>
    struct __is_move_iterator<move_iterator<_Iterator> >
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<typename _Iterator>

    auto
    __miter_base(move_iterator<_Iterator> __it)
    -> decltype(__miter_base(__it.base()))
    { return __miter_base(__it.base()); }
# 2497 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h" 3
}
# 68 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 2 3

# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/debug/debug.h" 1 3
# 48 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/debug/debug.h" 3
namespace std
{
  namespace __debug { }
}




namespace __gnu_debug
{
  using namespace std::__debug;

  template<typename _Ite, typename _Seq, typename _Cat>
    struct _Safe_iterator;
}
# 70 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 2 3

# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/predefined_ops.h" 1 3
# 35 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/predefined_ops.h" 3
namespace __gnu_cxx
{
namespace __ops
{
  struct _Iter_less_iter
  {
    template<typename _Iterator1, typename _Iterator2>

      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 < *__it2; }
  };


  inline _Iter_less_iter
  __iter_less_iter()
  { return _Iter_less_iter(); }

  struct _Iter_less_val
  {

    constexpr _Iter_less_val() = default;





    explicit
    _Iter_less_val(_Iter_less_iter) { }

    template<typename _Iterator, typename _Value>

      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it < __val; }
  };


  inline _Iter_less_val
  __iter_less_val()
  { return _Iter_less_val(); }


  inline _Iter_less_val
  __iter_comp_val(_Iter_less_iter)
  { return _Iter_less_val(); }

  struct _Val_less_iter
  {

    constexpr _Val_less_iter() = default;





    explicit
    _Val_less_iter(_Iter_less_iter) { }

    template<typename _Value, typename _Iterator>

      bool
      operator()(_Value& __val, _Iterator __it) const
      { return __val < *__it; }
  };


  inline _Val_less_iter
  __val_less_iter()
  { return _Val_less_iter(); }


  inline _Val_less_iter
  __val_comp_iter(_Iter_less_iter)
  { return _Val_less_iter(); }

  struct _Iter_equal_to_iter
  {
    template<typename _Iterator1, typename _Iterator2>

      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 == *__it2; }
  };


  inline _Iter_equal_to_iter
  __iter_equal_to_iter()
  { return _Iter_equal_to_iter(); }

  struct _Iter_equal_to_val
  {
    template<typename _Iterator, typename _Value>

      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it == __val; }
  };


  inline _Iter_equal_to_val
  __iter_equal_to_val()
  { return _Iter_equal_to_val(); }


  inline _Iter_equal_to_val
  __iter_comp_val(_Iter_equal_to_iter)
  { return _Iter_equal_to_val(); }

  template<typename _Compare>
    struct _Iter_comp_iter
    {
      _Compare _M_comp;

      explicit
      _Iter_comp_iter(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }

      template<typename _Iterator1, typename _Iterator2>

        bool
        operator()(_Iterator1 __it1, _Iterator2 __it2)
        { return bool(_M_comp(*__it1, *__it2)); }
    };

  template<typename _Compare>

    inline _Iter_comp_iter<_Compare>
    __iter_comp_iter(_Compare __comp)
    { return _Iter_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    struct _Iter_comp_val
    {
      _Compare _M_comp;


      explicit
      _Iter_comp_val(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }


      explicit
      _Iter_comp_val(const _Iter_comp_iter<_Compare>& __comp)
 : _M_comp(__comp._M_comp)
      { }



      explicit
      _Iter_comp_val(_Iter_comp_iter<_Compare>&& __comp)
 : _M_comp(std::move(__comp._M_comp))
      { }


      template<typename _Iterator, typename _Value>

 bool
 operator()(_Iterator __it, _Value& __val)
 { return bool(_M_comp(*__it, __val)); }
    };

  template<typename _Compare>

    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Compare __comp)
    { return _Iter_comp_val<_Compare>(std::move(__comp)); }

  template<typename _Compare>

    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Iter_comp_iter<_Compare> __comp)
    { return _Iter_comp_val<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    struct _Val_comp_iter
    {
      _Compare _M_comp;


      explicit
      _Val_comp_iter(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }


      explicit
      _Val_comp_iter(const _Iter_comp_iter<_Compare>& __comp)
 : _M_comp(__comp._M_comp)
      { }



      explicit
      _Val_comp_iter(_Iter_comp_iter<_Compare>&& __comp)
 : _M_comp(std::move(__comp._M_comp))
      { }


      template<typename _Value, typename _Iterator>

 bool
 operator()(_Value& __val, _Iterator __it)
 { return bool(_M_comp(__val, *__it)); }
    };

  template<typename _Compare>

    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Compare __comp)
    { return _Val_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Compare>

    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Iter_comp_iter<_Compare> __comp)
    { return _Val_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Value>
    struct _Iter_equals_val
    {
      _Value& _M_value;


      explicit
      _Iter_equals_val(_Value& __value)
 : _M_value(__value)
      { }

      template<typename _Iterator>

 bool
 operator()(_Iterator __it)
 { return *__it == _M_value; }
    };

  template<typename _Value>

    inline _Iter_equals_val<_Value>
    __iter_equals_val(_Value& __val)
    { return _Iter_equals_val<_Value>(__val); }

  template<typename _Iterator1>
    struct _Iter_equals_iter
    {
      _Iterator1 _M_it1;


      explicit
      _Iter_equals_iter(_Iterator1 __it1)
 : _M_it1(__it1)
      { }

      template<typename _Iterator2>

 bool
 operator()(_Iterator2 __it2)
 { return *__it2 == *_M_it1; }
    };

  template<typename _Iterator>

    inline _Iter_equals_iter<_Iterator>
    __iter_comp_iter(_Iter_equal_to_iter, _Iterator __it)
    { return _Iter_equals_iter<_Iterator>(__it); }

  template<typename _Predicate>
    struct _Iter_pred
    {
      _Predicate _M_pred;


      explicit
      _Iter_pred(_Predicate __pred)
 : _M_pred(std::move(__pred))
      { }

      template<typename _Iterator>

 bool
 operator()(_Iterator __it)
 { return bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>

    inline _Iter_pred<_Predicate>
    __pred_iter(_Predicate __pred)
    { return _Iter_pred<_Predicate>(std::move(__pred)); }

  template<typename _Compare, typename _Value>
    struct _Iter_comp_to_val
    {
      _Compare _M_comp;
      _Value& _M_value;


      _Iter_comp_to_val(_Compare __comp, _Value& __value)
 : _M_comp(std::move(__comp)), _M_value(__value)
      { }

      template<typename _Iterator>

 bool
 operator()(_Iterator __it)
 { return bool(_M_comp(*__it, _M_value)); }
    };

  template<typename _Compare, typename _Value>
    _Iter_comp_to_val<_Compare, _Value>

    __iter_comp_val(_Compare __comp, _Value &__val)
    {
      return _Iter_comp_to_val<_Compare, _Value>(std::move(__comp), __val);
    }

  template<typename _Compare, typename _Iterator1>
    struct _Iter_comp_to_iter
    {
      _Compare _M_comp;
      _Iterator1 _M_it1;


      _Iter_comp_to_iter(_Compare __comp, _Iterator1 __it1)
 : _M_comp(std::move(__comp)), _M_it1(__it1)
      { }

      template<typename _Iterator2>

 bool
 operator()(_Iterator2 __it2)
 { return bool(_M_comp(*__it2, *_M_it1)); }
    };

  template<typename _Compare, typename _Iterator>

    inline _Iter_comp_to_iter<_Compare, _Iterator>
    __iter_comp_iter(_Iter_comp_iter<_Compare> __comp, _Iterator __it)
    {
      return _Iter_comp_to_iter<_Compare, _Iterator>(
   std::move(__comp._M_comp), __it);
    }

  template<typename _Predicate>
    struct _Iter_negate
    {
      _Predicate _M_pred;


      explicit
      _Iter_negate(_Predicate __pred)
 : _M_pred(std::move(__pred))
      { }

      template<typename _Iterator>

 bool
 operator()(_Iterator __it)
 { return !bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>

    inline _Iter_negate<_Predicate>
    __negate(_Iter_pred<_Predicate> __pred)
    { return _Iter_negate<_Predicate>(std::move(__pred._M_pred)); }

}
}
# 72 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 2 3







namespace std __attribute__ ((__visibility__ ("default")))
{






  template<typename _Tp, typename _Up>

    inline int
    __memcmp(const _Tp* __first1, const _Up* __first2, size_t __num)
    {

      static_assert(sizeof(_Tp) == sizeof(_Up), "can be compared with memcmp");
# 105 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
 return __builtin_memcmp(__first1, __first2, sizeof(_Tp) * __num);
    }
# 149 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>

    inline void
    iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
    {
# 182 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
      swap(*__a, *__b);

    }
# 198 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>

    _ForwardIterator2
    swap_ranges(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
  _ForwardIterator2 __first2)
    {





                                                       ;

      for (; __first1 != __last1; ++__first1, (void)++__first2)
 std::iter_swap(__first1, __first2);
      return __first2;
    }
# 227 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _Tp>

    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b)
    {



      if (__b < __a)
 return __b;
      return __a;
    }
# 251 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _Tp>

    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b)
    {



      if (__a < __b)
 return __b;
      return __a;
    }
# 275 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>

    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__b, __a))
 return __b;
      return __a;
    }
# 297 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>

    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__a, __b))
 return __b;
      return __a;
    }



  template<typename _Iterator>

    inline _Iterator
    __niter_base(_Iterator __it)
    noexcept(std::is_nothrow_copy_constructible<_Iterator>::value)
    { return __it; }

  template<typename _Ite, typename _Seq>
    _Ite
    __niter_base(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq,
   std::random_access_iterator_tag>&);




  template<typename _From, typename _To>

    inline _From
    __niter_wrap(_From __from, _To __res)
    { return __from + (__res - std::__niter_base(__from)); }


  template<typename _Iterator>

    inline _Iterator
    __niter_wrap(const _Iterator&, _Iterator __res)
    { return __res; }







  template<bool _IsMove, bool _IsSimple, typename _Category>
    struct __copy_move
    {
      template<typename _II, typename _OI>

 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   for (; __first != __last; ++__result, (void)++__first)
     *__result = *__first;
   return __result;
 }
    };


  template<typename _Category>
    struct __copy_move<true, false, _Category>
    {
      template<typename _II, typename _OI>

 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   for (; __first != __last; ++__result, (void)++__first)
     *__result = std::move(*__first);
   return __result;
 }
    };


  template<>
    struct __copy_move<false, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>

 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = *__first;
       ++__first;
       ++__result;
     }
   return __result;
 }
    };


  template<>
    struct __copy_move<true, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>

 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = std::move(*__first);
       ++__first;
       ++__result;
     }
   return __result;
 }
    };


  template<bool _IsMove>
    struct __copy_move<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>

 static _Tp*
 __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
 {

   using __assignable = conditional<_IsMove,
        is_move_assignable<_Tp>,
        is_copy_assignable<_Tp>>;

   static_assert( __assignable::type::value, "type is not assignable" );

   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
   return __result + _Num;
 }
    };



  template<typename _Tp, typename _Ref, typename _Ptr>
    struct _Deque_iterator;

  struct _Bit_iterator;





  template<typename _CharT>
    struct char_traits;

  template<typename _CharT, typename _Traits>
    class istreambuf_iterator;

  template<typename _CharT, typename _Traits>
    class ostreambuf_iterator;

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(_CharT*, _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(const _CharT*, const _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
        _CharT*>::__type
    __copy_move_a2(istreambuf_iterator<_CharT, char_traits<_CharT> >,
     istreambuf_iterator<_CharT, char_traits<_CharT> >, _CharT*);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value,
      std::_Deque_iterator<_CharT, _CharT&, _CharT*> >::__type
    __copy_move_a2(
 istreambuf_iterator<_CharT, char_traits<_CharT> >,
 istreambuf_iterator<_CharT, char_traits<_CharT> >,
 std::_Deque_iterator<_CharT, _CharT&, _CharT*>);

  template<bool _IsMove, typename _II, typename _OI>

    inline _OI
    __copy_move_a2(_II __first, _II __last, _OI __result)
    {
      typedef typename iterator_traits<_II>::iterator_category _Category;





      return std::__copy_move<_IsMove, __memcpyable<_OI, _II>::__value,
         _Category>::__copy_m(__first, __last, __result);
    }

  template<bool _IsMove,
    typename _Tp, typename _Ref, typename _Ptr, typename _OI>
    _OI
    __copy_move_a1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
     std::_Deque_iterator<_Tp, _Ref, _Ptr>,
     _OI);

  template<bool _IsMove,
    typename _ITp, typename _IRef, typename _IPtr, typename _OTp>
    std::_Deque_iterator<_OTp, _OTp&, _OTp*>
    __copy_move_a1(std::_Deque_iterator<_ITp, _IRef, _IPtr>,
     std::_Deque_iterator<_ITp, _IRef, _IPtr>,
     std::_Deque_iterator<_OTp, _OTp&, _OTp*>);

  template<bool _IsMove, typename _II, typename _Tp>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value,
      std::_Deque_iterator<_Tp, _Tp&, _Tp*> >::__type
    __copy_move_a1(_II, _II, std::_Deque_iterator<_Tp, _Tp&, _Tp*>);

  template<bool _IsMove, typename _II, typename _OI>

    inline _OI
    __copy_move_a1(_II __first, _II __last, _OI __result)
    { return std::__copy_move_a2<_IsMove>(__first, __last, __result); }

  template<bool _IsMove, typename _II, typename _OI>

    inline _OI
    __copy_move_a(_II __first, _II __last, _OI __result)
    {
      return std::__niter_wrap(__result,
  std::__copy_move_a1<_IsMove>(std::__niter_base(__first),
          std::__niter_base(__last),
          std::__niter_base(__result)));
    }

  template<bool _IsMove,
    typename _Ite, typename _Seq, typename _Cat, typename _OI>
    _OI
    __copy_move_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
    const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
    _OI);

  template<bool _IsMove,
    typename _II, typename _Ite, typename _Seq, typename _Cat>
    __gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __copy_move_a(_II, _II,
    const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&);

  template<bool _IsMove,
    typename _IIte, typename _ISeq, typename _ICat,
    typename _OIte, typename _OSeq, typename _OCat>
    ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>
    __copy_move_a(const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
    const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
    const ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>&);

  template<typename _InputIterator, typename _Size, typename _OutputIterator>

    _OutputIterator
    __copy_n_a(_InputIterator __first, _Size __n, _OutputIterator __result,
        bool)
    {
      if (__n > 0)
 {
   while (true)
     {
       *__result = *__first;
       ++__result;
       if (--__n > 0)
  ++__first;
       else
  break;
     }
 }
      return __result;
    }

  template<typename _CharT, typename _Size>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value, _CharT*>::__type
    __copy_n_a(istreambuf_iterator<_CharT, char_traits<_CharT> >,
        _Size, _CharT*, bool);

  template<typename _CharT, typename _Size>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value,
      std::_Deque_iterator<_CharT, _CharT&, _CharT*> >::__type
    __copy_n_a(istreambuf_iterator<_CharT, char_traits<_CharT> >, _Size,
        std::_Deque_iterator<_CharT, _CharT&, _CharT*>,
        bool);
# 608 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _II, typename _OI>

    inline _OI
    copy(_II __first, _II __last, _OI __result)
    {




                                                                       ;

      return std::__copy_move_a<__is_move_iterator<_II>::__value>
      (std::__miter_base(__first), std::__miter_base(__last), __result);
    }
# 641 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _II, typename _OI>

    inline _OI
    move(_II __first, _II __last, _OI __result)
    {




                                                                       ;

      return std::__copy_move_a<true>(std::__miter_base(__first),
          std::__miter_base(__last), __result);
    }






  template<bool _IsMove, bool _IsSimple, typename _Category>
    struct __copy_move_backward
    {
      template<typename _BI1, typename _BI2>

 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   while (__first != __last)
     *--__result = *--__last;
   return __result;
 }
    };


  template<typename _Category>
    struct __copy_move_backward<true, false, _Category>
    {
      template<typename _BI1, typename _BI2>

 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   while (__first != __last)
     *--__result = std::move(*--__last);
   return __result;
 }
    };


  template<>
    struct __copy_move_backward<false, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>

 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   typename iterator_traits<_BI1>::difference_type
     __n = __last - __first;
   for (; __n > 0; --__n)
     *--__result = *--__last;
   return __result;
 }
    };


  template<>
    struct __copy_move_backward<true, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>

 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   typename iterator_traits<_BI1>::difference_type
     __n = __last - __first;
   for (; __n > 0; --__n)
     *--__result = std::move(*--__last);
   return __result;
 }
    };


  template<bool _IsMove>
    struct __copy_move_backward<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>

 static _Tp*
 __copy_move_b(const _Tp* __first, const _Tp* __last, _Tp* __result)
 {

   using __assignable = conditional<_IsMove,
        is_move_assignable<_Tp>,
        is_copy_assignable<_Tp>>;

   static_assert( __assignable::type::value, "type is not assignable" );

   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
   return __result - _Num;
 }
    };

  template<bool _IsMove, typename _BI1, typename _BI2>

    inline _BI2
    __copy_move_backward_a2(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      typedef typename iterator_traits<_BI1>::iterator_category _Category;





      return std::__copy_move_backward<_IsMove,
           __memcpyable<_BI2, _BI1>::__value,
           _Category>::__copy_move_b(__first,
         __last,
         __result);
    }

  template<bool _IsMove, typename _BI1, typename _BI2>

    inline _BI2
    __copy_move_backward_a1(_BI1 __first, _BI1 __last, _BI2 __result)
    { return std::__copy_move_backward_a2<_IsMove>(__first, __last, __result); }

  template<bool _IsMove,
    typename _Tp, typename _Ref, typename _Ptr, typename _OI>
    _OI
    __copy_move_backward_a1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
       std::_Deque_iterator<_Tp, _Ref, _Ptr>,
       _OI);

  template<bool _IsMove,
    typename _ITp, typename _IRef, typename _IPtr, typename _OTp>
    std::_Deque_iterator<_OTp, _OTp&, _OTp*>
    __copy_move_backward_a1(
   std::_Deque_iterator<_ITp, _IRef, _IPtr>,
   std::_Deque_iterator<_ITp, _IRef, _IPtr>,
   std::_Deque_iterator<_OTp, _OTp&, _OTp*>);

  template<bool _IsMove, typename _II, typename _Tp>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value,
      std::_Deque_iterator<_Tp, _Tp&, _Tp*> >::__type
    __copy_move_backward_a1(_II, _II,
       std::_Deque_iterator<_Tp, _Tp&, _Tp*>);

  template<bool _IsMove, typename _II, typename _OI>

    inline _OI
    __copy_move_backward_a(_II __first, _II __last, _OI __result)
    {
      return std::__niter_wrap(__result,
  std::__copy_move_backward_a1<_IsMove>
    (std::__niter_base(__first), std::__niter_base(__last),
     std::__niter_base(__result)));
    }

  template<bool _IsMove,
    typename _Ite, typename _Seq, typename _Cat, typename _OI>
    _OI
    __copy_move_backward_a(
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
  _OI);

  template<bool _IsMove,
    typename _II, typename _Ite, typename _Seq, typename _Cat>
    __gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __copy_move_backward_a(_II, _II,
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&);

  template<bool _IsMove,
    typename _IIte, typename _ISeq, typename _ICat,
    typename _OIte, typename _OSeq, typename _OCat>
    ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>
    __copy_move_backward_a(
  const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
  const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
  const ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>&);
# 845 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _BI1, typename _BI2>

    inline _BI2
    copy_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {






                                                                       ;

      return std::__copy_move_backward_a<__is_move_iterator<_BI1>::__value>
      (std::__miter_base(__first), std::__miter_base(__last), __result);
    }
# 881 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _BI1, typename _BI2>

    inline _BI2
    move_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {






                                                                       ;

      return std::__copy_move_backward_a<true>(std::__miter_base(__first),
            std::__miter_base(__last),
            __result);
    }






  template<typename _ForwardIterator, typename _Tp>

    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, void>::__type
    __fill_a1(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      for (; __first != __last; ++__first)
 *__first = __value;
    }

  template<typename _ForwardIterator, typename _Tp>

    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, void>::__type
    __fill_a1(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __first != __last; ++__first)
 *__first = __tmp;
    }


  template<typename _Tp>

    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, void>::__type
    __fill_a1(_Tp* __first, _Tp* __last, const _Tp& __c)
    {
      const _Tp __tmp = __c;
# 943 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
      if (const size_t __len = __last - __first)
 __builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
    }

  template<typename _Ite, typename _Cont, typename _Tp>

    inline void
    __fill_a1(::__gnu_cxx::__normal_iterator<_Ite, _Cont> __first,
       ::__gnu_cxx::__normal_iterator<_Ite, _Cont> __last,
       const _Tp& __value)
    { std::__fill_a1(__first.base(), __last.base(), __value); }

  template<typename _Tp, typename _VTp>
    void
    __fill_a1(const std::_Deque_iterator<_Tp, _Tp&, _Tp*>&,
       const std::_Deque_iterator<_Tp, _Tp&, _Tp*>&,
       const _VTp&);

  void
  __fill_a1(std::_Bit_iterator, std::_Bit_iterator,
     const bool&);

  template<typename _FIte, typename _Tp>

    inline void
    __fill_a(_FIte __first, _FIte __last, const _Tp& __value)
    { std::__fill_a1(__first, __last, __value); }

  template<typename _Ite, typename _Seq, typename _Cat, typename _Tp>
    void
    __fill_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
      const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
      const _Tp&);
# 989 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>

    inline void
    fill(_ForwardIterator __first, _ForwardIterator __last, const _Tp& __value)
    {



                                                     ;

      std::__fill_a(__first, __last, __value);
    }


  inline constexpr int
  __size_to_integer(int __n) { return __n; }
  inline constexpr unsigned
  __size_to_integer(unsigned __n) { return __n; }
  inline constexpr long
  __size_to_integer(long __n) { return __n; }
  inline constexpr unsigned long
  __size_to_integer(unsigned long __n) { return __n; }
  inline constexpr long long
  __size_to_integer(long long __n) { return __n; }
  inline constexpr unsigned long long
  __size_to_integer(unsigned long long __n) { return __n; }
# 1041 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  inline constexpr long long
  __size_to_integer(float __n) { return (long long)__n; }
  inline constexpr long long
  __size_to_integer(double __n) { return (long long)__n; }
  inline constexpr long long
  __size_to_integer(long double __n) { return (long long)__n; }





  template<typename _OutputIterator, typename _Size, typename _Tp>

    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a1(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      for (; __n > 0; --__n, (void) ++__first)
 *__first = __value;
      return __first;
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>

    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a1(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __n > 0; --__n, (void) ++__first)
 *__first = __tmp;
      return __first;
    }

  template<typename _Ite, typename _Seq, typename _Cat, typename _Size,
    typename _Tp>
    ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __fill_n_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>& __first,
        _Size __n, const _Tp& __value,
        std::input_iterator_tag);

  template<typename _OutputIterator, typename _Size, typename _Tp>

    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::output_iterator_tag)
    {

      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");

      return __fill_n_a1(__first, __n, __value);
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>

    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::input_iterator_tag)
    {

      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");

      return __fill_n_a1(__first, __n, __value);
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>

    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::random_access_iterator_tag)
    {

      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");

      if (__n <= 0)
 return __first;

                                                    ;

      std::__fill_a(__first, __first + __n, __value);
      return __first + __n;
    }
# 1141 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _OI, typename _Size, typename _Tp>

    inline _OI
    fill_n(_OI __first, _Size __n, const _Tp& __value)
    {



      return std::__fill_n_a(__first, std::__size_to_integer(__n), __value,
          std::__iterator_category(__first));
    }

  template<bool _BoolType>
    struct __equal
    {
      template<typename _II1, typename _II2>

 static bool
 equal(_II1 __first1, _II1 __last1, _II2 __first2)
 {
   for (; __first1 != __last1; ++__first1, (void) ++__first2)
     if (!(*__first1 == *__first2))
       return false;
   return true;
 }
    };

  template<>
    struct __equal<true>
    {
      template<typename _Tp>

 static bool
 equal(const _Tp* __first1, const _Tp* __last1, const _Tp* __first2)
 {
   if (const size_t __len = (__last1 - __first1))
     return !std::__memcmp(__first1, __first2, __len);
   return true;
 }
    };

  template<typename _Tp, typename _Ref, typename _Ptr, typename _II>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value, bool>::__type
    __equal_aux1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
   std::_Deque_iterator<_Tp, _Ref, _Ptr>,
   _II);

  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __equal_aux1(std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
   std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
   std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);

  template<typename _II, typename _Tp, typename _Ref, typename _Ptr>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value, bool>::__type
    __equal_aux1(_II, _II,
  std::_Deque_iterator<_Tp, _Ref, _Ptr>);

  template<typename _II1, typename _II2>

    inline bool
    __equal_aux1(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      const bool __simple = ((__is_integer<_ValueType1>::__value
         || __is_pointer<_ValueType1>::__value)
        && __memcmpable<_II1, _II2>::__value);
      return std::__equal<__simple>::equal(__first1, __last1, __first2);
    }

  template<typename _II1, typename _II2>

    inline bool
    __equal_aux(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      return std::__equal_aux1(std::__niter_base(__first1),
          std::__niter_base(__last1),
          std::__niter_base(__first2));
    }

  template<typename _II1, typename _Seq1, typename _Cat1, typename _II2>
    bool
    __equal_aux(const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  _II2);

  template<typename _II1, typename _II2, typename _Seq2, typename _Cat2>
    bool
    __equal_aux(_II1, _II1,
  const ::__gnu_debug::_Safe_iterator<_II2, _Seq2, _Cat2>&);

  template<typename _II1, typename _Seq1, typename _Cat1,
    typename _II2, typename _Seq2, typename _Cat2>
    bool
    __equal_aux(const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II2, _Seq2, _Cat2>&);

  template<typename, typename>
    struct __lc_rai
    {
      template<typename _II1, typename _II2>

 static _II1
 __newlast1(_II1, _II1 __last1, _II2, _II2)
 { return __last1; }

      template<typename _II>

 static bool
 __cnd2(_II __first, _II __last)
 { return __first != __last; }
    };

  template<>
    struct __lc_rai<random_access_iterator_tag, random_access_iterator_tag>
    {
      template<typename _RAI1, typename _RAI2>

 static _RAI1
 __newlast1(_RAI1 __first1, _RAI1 __last1,
     _RAI2 __first2, _RAI2 __last2)
 {
   const typename iterator_traits<_RAI1>::difference_type
     __diff1 = __last1 - __first1;
   const typename iterator_traits<_RAI2>::difference_type
     __diff2 = __last2 - __first2;
   return __diff2 < __diff1 ? __first1 + __diff2 : __last1;
 }

      template<typename _RAI>
 static bool
 __cnd2(_RAI, _RAI)
 { return true; }
    };

  template<typename _II1, typename _II2, typename _Compare>

    bool
    __lexicographical_compare_impl(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2,
       _Compare __comp)
    {
      typedef typename iterator_traits<_II1>::iterator_category _Category1;
      typedef typename iterator_traits<_II2>::iterator_category _Category2;
      typedef std::__lc_rai<_Category1, _Category2> __rai_type;

      __last1 = __rai_type::__newlast1(__first1, __last1, __first2, __last2);
      for (; __first1 != __last1 && __rai_type::__cnd2(__first2, __last2);
    ++__first1, (void)++__first2)
 {
   if (__comp(__first1, __first2))
     return true;
   if (__comp(__first2, __first1))
     return false;
 }
      return __first1 == __last1 && __first2 != __last2;
    }

  template<bool _BoolType>
    struct __lexicographical_compare
    {
      template<typename _II1, typename _II2>

 static bool
 __lc(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
 {
   using __gnu_cxx::__ops::__iter_less_iter;
   return std::__lexicographical_compare_impl(__first1, __last1,
           __first2, __last2,
           __iter_less_iter());
 }

      template<typename _II1, typename _II2>

 static int
 __3way(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
 {
   while (__first1 != __last1)
     {
       if (__first2 == __last2)
  return +1;
       if (*__first1 < *__first2)
  return -1;
       if (*__first2 < *__first1)
  return +1;
       ++__first1;
       ++__first2;
     }
   return int(__first2 == __last2) - 1;
 }
    };

  template<>
    struct __lexicographical_compare<true>
    {
      template<typename _Tp, typename _Up>

 static bool
 __lc(const _Tp* __first1, const _Tp* __last1,
      const _Up* __first2, const _Up* __last2)
 { return __3way(__first1, __last1, __first2, __last2) < 0; }

      template<typename _Tp, typename _Up>

 static ptrdiff_t
 __3way(const _Tp* __first1, const _Tp* __last1,
        const _Up* __first2, const _Up* __last2)
 {
   const size_t __len1 = __last1 - __first1;
   const size_t __len2 = __last2 - __first2;
   if (const size_t __len = std::min(__len1, __len2))
     if (int __result = std::__memcmp(__first1, __first2, __len))
       return __result;
   return ptrdiff_t(__len1 - __len2);
 }
    };

  template<typename _II1, typename _II2>

    inline bool
    __lexicographical_compare_aux1(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple =
 (__is_memcmp_ordered_with<_ValueType1, _ValueType2>::__value
  && __is_pointer<_II1>::__value
  && __is_pointer<_II2>::__value







  );

      return std::__lexicographical_compare<__simple>::__lc(__first1, __last1,
           __first2, __last2);
    }

  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2>
    bool
    __lexicographical_compare_aux1(
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 _Tp2*, _Tp2*);

  template<typename _Tp1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __lexicographical_compare_aux1(_Tp1*, _Tp1*,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);

  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __lexicographical_compare_aux1(
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);

  template<typename _II1, typename _II2>

    inline bool
    __lexicographical_compare_aux(_II1 __first1, _II1 __last1,
      _II2 __first2, _II2 __last2)
    {
      return std::__lexicographical_compare_aux1(std::__niter_base(__first1),
       std::__niter_base(__last1),
       std::__niter_base(__first2),
       std::__niter_base(__last2));
    }

  template<typename _Iter1, typename _Seq1, typename _Cat1,
    typename _II2>
    bool
    __lexicographical_compare_aux(
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  _II2, _II2);

  template<typename _II1,
    typename _Iter2, typename _Seq2, typename _Cat2>
    bool
    __lexicographical_compare_aux(
  _II1, _II1,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&);

  template<typename _Iter1, typename _Seq1, typename _Cat1,
    typename _Iter2, typename _Seq2, typename _Cat2>
    bool
    __lexicographical_compare_aux(
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&);

  template<typename _ForwardIterator, typename _Tp, typename _Compare>

    _ForwardIterator
    __lower_bound(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;

      _DistanceType __len = std::distance(__first, __last);

      while (__len > 0)
 {
   _DistanceType __half = __len >> 1;
   _ForwardIterator __middle = __first;
   std::advance(__middle, __half);
   if (__comp(__middle, __val))
     {
       __first = __middle;
       ++__first;
       __len = __len - __half - 1;
     }
   else
     __len = __half;
 }
      return __first;
    }
# 1487 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>

    inline _ForwardIterator
    lower_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val)
    {




                                                                  ;

      return std::__lower_bound(__first, __last, __val,
    __gnu_cxx::__ops::__iter_less_val());
    }



  inline constexpr int
  __lg(int __n)
  { return (int)sizeof(int) * 8 - 1 - __builtin_clz(__n); }

  inline constexpr unsigned
  __lg(unsigned __n)
  { return (int)sizeof(int) * 8 - 1 - __builtin_clz(__n); }

  inline constexpr long
  __lg(long __n)
  { return (int)sizeof(long) * 8 - 1 - __builtin_clzl(__n); }

  inline constexpr unsigned long
  __lg(unsigned long __n)
  { return (int)sizeof(long) * 8 - 1 - __builtin_clzl(__n); }

  inline constexpr long long
  __lg(long long __n)
  { return (int)sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }

  inline constexpr unsigned long long
  __lg(unsigned long long __n)
  { return (int)sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }
# 1543 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>

    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2)
    {






                                                                         ;

      return std::__equal_aux(__first1, __last1, __first2);
    }
# 1574 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>

    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _BinaryPredicate __binary_pred)
    {



                                                       ;

      for (; __first1 != __last1; ++__first1, (void)++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return true;
    }



  template<typename _II1, typename _II2>

    inline bool
    __equal4(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
    {
      using _RATag = random_access_iterator_tag;
      using _Cat1 = typename iterator_traits<_II1>::iterator_category;
      using _Cat2 = typename iterator_traits<_II2>::iterator_category;
      using _RAIters = __and_<is_same<_Cat1, _RATag>, is_same<_Cat2, _RATag>>;
      if (_RAIters())
 {
   auto __d1 = std::distance(__first1, __last1);
   auto __d2 = std::distance(__first2, __last2);
   if (__d1 != __d2)
     return false;
   return std::equal(__first1, __last1, __first2);
 }

      for (; __first1 != __last1 && __first2 != __last2;
   ++__first1, (void)++__first2)
 if (!(*__first1 == *__first2))
   return false;
      return __first1 == __last1 && __first2 == __last2;
    }


  template<typename _II1, typename _II2, typename _BinaryPredicate>

    inline bool
    __equal4(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2,
      _BinaryPredicate __binary_pred)
    {
      using _RATag = random_access_iterator_tag;
      using _Cat1 = typename iterator_traits<_II1>::iterator_category;
      using _Cat2 = typename iterator_traits<_II2>::iterator_category;
      using _RAIters = __and_<is_same<_Cat1, _RATag>, is_same<_Cat2, _RATag>>;
      if (_RAIters())
 {
   auto __d1 = std::distance(__first1, __last1);
   auto __d2 = std::distance(__first2, __last2);
   if (__d1 != __d2)
     return false;
   return std::equal(__first1, __last1, __first2,
           __binary_pred);
 }

      for (; __first1 != __last1 && __first2 != __last2;
   ++__first1, (void)++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return __first1 == __last1 && __first2 == __last2;
    }
# 1729 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>

    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {
# 1744 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
                                                       ;
                                                       ;

      return std::__lexicographical_compare_aux(__first1, __last1,
      __first2, __last2);
    }
# 1764 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2, typename _Compare>

    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2, _Compare __comp)
    {



                                                       ;
                                                       ;

      return std::__lexicographical_compare_impl
 (__first1, __last1, __first2, __last2,
  __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }
# 1877 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>

    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __binary_pred(__first1, __first2))
 {
   ++__first1;
   ++__first2;
 }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
# 1905 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2>

    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2)
    {






                                                       ;

      return std::__mismatch(__first1, __last1, __first2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 1939 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>

    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {



                                                       ;

      return std::__mismatch(__first1, __last1, __first2,
 __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }
# 2046 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _InputIterator, typename _Predicate>

    inline _InputIterator
    __find_if(_InputIterator __first, _InputIterator __last,
       _Predicate __pred, input_iterator_tag)
    {
      while (__first != __last && !__pred(__first))
 ++__first;
      return __first;
    }


  template<typename _RandomAccessIterator, typename _Predicate>

    _RandomAccessIterator
    __find_if(_RandomAccessIterator __first, _RandomAccessIterator __last,
       _Predicate __pred, random_access_iterator_tag)
    {
      typename iterator_traits<_RandomAccessIterator>::difference_type
 __trip_count = (__last - __first) >> 2;

      for (; __trip_count > 0; --__trip_count)
 {
   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;
 }

      switch (__last - __first)
 {
 case 3:
   if (__pred(__first))
     return __first;
   ++__first;

 case 2:
   if (__pred(__first))
     return __first;
   ++__first;

 case 1:
   if (__pred(__first))
     return __first;
   ++__first;

 case 0:
 default:
   return __last;
 }
    }

  template<typename _Iterator, typename _Predicate>

    inline _Iterator
    __find_if(_Iterator __first, _Iterator __last, _Predicate __pred)
    {
      return __find_if(__first, __last, __pred,
         std::__iterator_category(__first));
    }

  template<typename _InputIterator, typename _Predicate>

    typename iterator_traits<_InputIterator>::difference_type
    __count_if(_InputIterator __first, _InputIterator __last, _Predicate __pred)
    {
      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      for (; __first != __last; ++__first)
 if (__pred(__first))
   ++__n;
      return __n;
    }


  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>

    bool
    __is_permutation(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
       _ForwardIterator2 __first2, _BinaryPredicate __pred)
    {


      for (; __first1 != __last1; ++__first1, (void)++__first2)
 if (!__pred(__first1, __first2))
   break;

      if (__first1 == __last1)
 return true;



      _ForwardIterator2 __last2 = __first2;
      std::advance(__last2, std::distance(__first1, __last1));
      for (_ForwardIterator1 __scan = __first1; __scan != __last1; ++__scan)
 {
   if (__scan != std::__find_if(__first1, __scan,
     __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan)))
     continue;

   auto __matches
     = std::__count_if(__first2, __last2,
   __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan));
   if (0 == __matches ||
       std::__count_if(__scan, __last1,
   __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan))
       != __matches)
     return false;
 }
      return true;
    }
# 2181 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>

    inline bool
    is_permutation(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
     _ForwardIterator2 __first2)
    {






                                                       ;

      return std::__is_permutation(__first1, __last1, __first2,
       __gnu_cxx::__ops::__iter_equal_to_iter());
    }



}
# 41 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/range_access.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/range_access.h" 3






namespace std __attribute__ ((__visibility__ ("default")))
{







  template<typename _Container>
    inline auto
    begin(_Container& __cont) -> decltype(__cont.begin())
    { return __cont.begin(); }






  template<typename _Container>
    inline auto
    begin(const _Container& __cont) -> decltype(__cont.begin())
    { return __cont.begin(); }






  template<typename _Container>
    inline auto
    end(_Container& __cont) -> decltype(__cont.end())
    { return __cont.end(); }






  template<typename _Container>
    inline auto
    end(const _Container& __cont) -> decltype(__cont.end())
    { return __cont.end(); }





  template<typename _Tp, size_t _Nm>
    inline _Tp*
    begin(_Tp (&__arr)[_Nm]) noexcept
    { return __arr; }






  template<typename _Tp, size_t _Nm>
    inline _Tp*
    end(_Tp (&__arr)[_Nm]) noexcept
    { return __arr + _Nm; }
# 342 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/range_access.h" 3
}
# 42 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 2 3


namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _Tp, std::size_t _Nm>
    struct __array_traits
    {
      typedef _Tp _Type[_Nm];
      typedef __is_swappable<_Tp> _Is_swappable;
      typedef __is_nothrow_swappable<_Tp> _Is_nothrow_swappable;

      static constexpr _Tp&
      _S_ref(const _Type& __t, std::size_t __n) noexcept
      { return const_cast<_Tp&>(__t[__n]); }

      static constexpr _Tp*
      _S_ptr(const _Type& __t) noexcept
      { return const_cast<_Tp*>(__t); }
    };

 template<typename _Tp>
   struct __array_traits<_Tp, 0>
   {
     struct _Type { };
     typedef true_type _Is_swappable;
     typedef true_type _Is_nothrow_swappable;

     static constexpr _Tp&
     _S_ref(const _Type&, std::size_t) noexcept
     { return *static_cast<_Tp*>(nullptr); }

     static constexpr _Tp*
     _S_ptr(const _Type&) noexcept
     { return nullptr; }
   };
# 94 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 3
  template<typename _Tp, std::size_t _Nm>
    struct array
    {
      typedef _Tp value_type;
      typedef value_type* pointer;
      typedef const value_type* const_pointer;
      typedef value_type& reference;
      typedef const value_type& const_reference;
      typedef value_type* iterator;
      typedef const value_type* const_iterator;
      typedef std::size_t size_type;
      typedef std::ptrdiff_t difference_type;
      typedef std::reverse_iterator<iterator> reverse_iterator;
      typedef std::reverse_iterator<const_iterator> const_reverse_iterator;


      typedef __array_traits<_Tp, _Nm> _AT_Type;
      typename _AT_Type::_Type _M_elems;




                           void
      fill(const value_type& __u)
      { std::fill_n(begin(), size(), __u); }

                           void
      swap(array& __other)
      noexcept(_AT_Type::_Is_nothrow_swappable::value)
      { std::swap_ranges(begin(), end(), __other.begin()); }


                           iterator
      begin() noexcept
      { return iterator(data()); }

                           const_iterator
      begin() const noexcept
      { return const_iterator(data()); }

                           iterator
      end() noexcept
      { return iterator(data() + _Nm); }

                           const_iterator
      end() const noexcept
      { return const_iterator(data() + _Nm); }

                           reverse_iterator
      rbegin() noexcept
      { return reverse_iterator(end()); }

                           const_reverse_iterator
      rbegin() const noexcept
      { return const_reverse_iterator(end()); }

                           reverse_iterator
      rend() noexcept
      { return reverse_iterator(begin()); }

                           const_reverse_iterator
      rend() const noexcept
      { return const_reverse_iterator(begin()); }

                           const_iterator
      cbegin() const noexcept
      { return const_iterator(data()); }

                           const_iterator
      cend() const noexcept
      { return const_iterator(data() + _Nm); }

                           const_reverse_iterator
      crbegin() const noexcept
      { return const_reverse_iterator(end()); }

                           const_reverse_iterator
      crend() const noexcept
      { return const_reverse_iterator(begin()); }


      constexpr size_type
      size() const noexcept { return _Nm; }

      constexpr size_type
      max_size() const noexcept { return _Nm; }

                         constexpr bool
      empty() const noexcept { return size() == 0; }


                           reference
      operator[](size_type __n) noexcept
      {
                                  ;
 return _AT_Type::_S_ref(_M_elems, __n);
      }

      constexpr const_reference
      operator[](size_type __n) const noexcept
      {



 return _AT_Type::_S_ref(_M_elems, __n);
      }

                           reference
      at(size_type __n)
      {
 if (__n >= _Nm)
   std::__throw_out_of_range_fmt(("array::at: __n (which is %zu) " ">= _Nm (which is %zu)"),

     __n, _Nm);
 return _AT_Type::_S_ref(_M_elems, __n);
      }

      constexpr const_reference
      at(size_type __n) const
      {


 return __n < _Nm ? _AT_Type::_S_ref(_M_elems, __n)
   : (std::__throw_out_of_range_fmt(("array::at: __n (which is %zu) " ">= _Nm (which is %zu)"),

        __n, _Nm),
      _AT_Type::_S_ref(_M_elems, 0));
      }

                           reference
      front() noexcept
      {
                              ;
 return *begin();
      }

      constexpr const_reference
      front() const noexcept
      {



 return _AT_Type::_S_ref(_M_elems, 0);
      }

                           reference
      back() noexcept
      {
                              ;
 return _Nm ? *(end() - 1) : *end();
      }

      constexpr const_reference
      back() const noexcept
      {



 return _Nm ? _AT_Type::_S_ref(_M_elems, _Nm - 1)
             : _AT_Type::_S_ref(_M_elems, 0);
      }

                           pointer
      data() noexcept
      { return _AT_Type::_S_ptr(_M_elems); }

                           const_pointer
      data() const noexcept
      { return _AT_Type::_S_ptr(_M_elems); }
    };
# 273 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 3
  template<typename _Tp, std::size_t _Nm>

    inline bool
    operator==(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return std::equal(__one.begin(), __one.end(), __two.begin()); }
# 302 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 3
  template<typename _Tp, std::size_t _Nm>

    inline bool
    operator!=(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return !(__one == __two); }

  template<typename _Tp, std::size_t _Nm>

    inline bool
    operator<(const array<_Tp, _Nm>& __a, const array<_Tp, _Nm>& __b)
    {
      return std::lexicographical_compare(__a.begin(), __a.end(),
       __b.begin(), __b.end());
    }

  template<typename _Tp, std::size_t _Nm>

    inline bool
    operator>(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return __two < __one; }

  template<typename _Tp, std::size_t _Nm>

    inline bool
    operator<=(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return !(__one > __two); }

  template<typename _Tp, std::size_t _Nm>

    inline bool
    operator>=(const array<_Tp, _Nm>& __one, const array<_Tp, _Nm>& __two)
    { return !(__one < __two); }



  template<typename _Tp, std::size_t _Nm>

    inline






    void

    swap(array<_Tp, _Nm>& __one, array<_Tp, _Nm>& __two)
    noexcept(noexcept(__one.swap(__two)))
    { __one.swap(__two); }
# 359 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 3
  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    constexpr _Tp&
    get(array<_Tp, _Nm>& __arr) noexcept
    {
      static_assert(_Int < _Nm, "array index is within bounds");
      return __array_traits<_Tp, _Nm>::_S_ref(__arr._M_elems, _Int);
    }

  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    constexpr _Tp&&
    get(array<_Tp, _Nm>&& __arr) noexcept
    {
      static_assert(_Int < _Nm, "array index is within bounds");
      return std::move(std::get<_Int>(__arr));
    }

  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    constexpr const _Tp&
    get(const array<_Tp, _Nm>& __arr) noexcept
    {
      static_assert(_Int < _Nm, "array index is within bounds");
      return __array_traits<_Tp, _Nm>::_S_ref(__arr._M_elems, _Int);
    }

  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    constexpr const _Tp&&
    get(const array<_Tp, _Nm>&& __arr) noexcept
    {
      static_assert(_Int < _Nm, "array index is within bounds");
      return std::move(std::get<_Int>(__arr));
    }
# 432 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/array" 3
  template<typename _Tp>
    struct tuple_size;


  template<typename _Tp, std::size_t _Nm>
    struct tuple_size<array<_Tp, _Nm>>
    : public integral_constant<std::size_t, _Nm> { };


  template<std::size_t _Int, typename _Tp>
    struct tuple_element;


  template<std::size_t _Int, typename _Tp, std::size_t _Nm>
    struct tuple_element<_Int, array<_Tp, _Nm>>
    {
      static_assert(_Int < _Nm, "index is out of bounds");
      typedef _Tp type;
    };

  template<typename _Tp, std::size_t _Nm>
    struct __is_tuple_like_impl<array<_Tp, _Nm>> : true_type
    { };


}
# 40 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/uses_allocator.h" 1 3
# 35 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/uses_allocator.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{




  struct __erased_type { };




  template<typename _Alloc, typename _Tp>
    using __is_erased_or_convertible
      = __or_<is_convertible<_Alloc, _Tp>, is_same<_Tp, __erased_type>>;


  struct allocator_arg_t { explicit allocator_arg_t() = default; };

                    constexpr allocator_arg_t allocator_arg =
    allocator_arg_t();

  template<typename _Tp, typename _Alloc, typename = __void_t<>>
    struct __uses_allocator_helper
    : false_type { };

  template<typename _Tp, typename _Alloc>
    struct __uses_allocator_helper<_Tp, _Alloc,
       __void_t<typename _Tp::allocator_type>>
    : __is_erased_or_convertible<_Alloc, typename _Tp::allocator_type>::type
    { };


  template<typename _Tp, typename _Alloc>
    struct uses_allocator
    : __uses_allocator_helper<_Tp, _Alloc>::type
    { };

  struct __uses_alloc_base { };

  struct __uses_alloc0 : __uses_alloc_base
  {
    struct _Sink { void operator=(const void*) { } } _M_a;
  };

  template<typename _Alloc>
    struct __uses_alloc1 : __uses_alloc_base { const _Alloc* _M_a; };

  template<typename _Alloc>
    struct __uses_alloc2 : __uses_alloc_base { const _Alloc* _M_a; };

  template<bool, typename _Tp, typename _Alloc, typename... _Args>
    struct __uses_alloc;

  template<typename _Tp, typename _Alloc, typename... _Args>
    struct __uses_alloc<true, _Tp, _Alloc, _Args...>
    : conditional<
        is_constructible<_Tp, allocator_arg_t, const _Alloc&, _Args...>::value,
        __uses_alloc1<_Alloc>,
        __uses_alloc2<_Alloc>>::type
    {


      static_assert(__or_<
   is_constructible<_Tp, allocator_arg_t, const _Alloc&, _Args...>,
   is_constructible<_Tp, _Args..., const _Alloc&>>::value,
   "construction with an allocator must be possible"
   " if uses_allocator is true");
    };

  template<typename _Tp, typename _Alloc, typename... _Args>
    struct __uses_alloc<false, _Tp, _Alloc, _Args...>
    : __uses_alloc0 { };

  template<typename _Tp, typename _Alloc, typename... _Args>
    using __uses_alloc_t =
      __uses_alloc<uses_allocator<_Tp, _Alloc>::value, _Tp, _Alloc, _Args...>;

  template<typename _Tp, typename _Alloc, typename... _Args>

    inline __uses_alloc_t<_Tp, _Alloc, _Args...>
    __use_alloc(const _Alloc& __a)
    {
      __uses_alloc_t<_Tp, _Alloc, _Args...> __ret;
      __ret._M_a = std::__addressof(__a);
      return __ret;
    }

  template<typename _Tp, typename _Alloc, typename... _Args>
    void
    __use_alloc(const _Alloc&&) = delete;







  template<template<typename...> class _Predicate,
    typename _Tp, typename _Alloc, typename... _Args>
    struct __is_uses_allocator_predicate
    : conditional<uses_allocator<_Tp, _Alloc>::value,
      __or_<_Predicate<_Tp, allocator_arg_t, _Alloc, _Args...>,
     _Predicate<_Tp, _Args..., _Alloc>>,
      _Predicate<_Tp, _Args...>>::type { };

  template<typename _Tp, typename _Alloc, typename... _Args>
    struct __is_uses_allocator_constructible
    : __is_uses_allocator_predicate<is_constructible, _Tp, _Alloc, _Args...>
    { };







  template<typename _Tp, typename _Alloc, typename... _Args>
    struct __is_nothrow_uses_allocator_constructible
    : __is_uses_allocator_predicate<is_nothrow_constructible,
        _Tp, _Alloc, _Args...>
    { };
# 165 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/uses_allocator.h" 3
  template<typename _Tp, typename... _Args>
    void __uses_allocator_construct_impl(__uses_alloc0 __a, _Tp* __ptr,
      _Args&&... __args)
    { ::new ((void*)__ptr) _Tp(std::forward<_Args>(__args)...); }

  template<typename _Tp, typename _Alloc, typename... _Args>
    void __uses_allocator_construct_impl(__uses_alloc1<_Alloc> __a, _Tp* __ptr,
      _Args&&... __args)
    {
      ::new ((void*)__ptr) _Tp(allocator_arg, *__a._M_a,
          std::forward<_Args>(__args)...);
    }

  template<typename _Tp, typename _Alloc, typename... _Args>
    void __uses_allocator_construct_impl(__uses_alloc2<_Alloc> __a, _Tp* __ptr,
      _Args&&... __args)
    { ::new ((void*)__ptr) _Tp(std::forward<_Args>(__args)..., *__a._M_a); }

  template<typename _Tp, typename _Alloc, typename... _Args>
    void __uses_allocator_construct(const _Alloc& __a, _Tp* __ptr,
        _Args&&... __args)
    {
      std::__uses_allocator_construct_impl(
   std::__use_alloc<_Tp, _Alloc, _Args...>(__a), __ptr,
   std::forward<_Args>(__args)...);
    }



}
# 41 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/invoke.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/invoke.h" 3








namespace std __attribute__ ((__visibility__ ("default")))
{
# 53 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/invoke.h" 3
  template<typename _Tp, typename _Up = typename __inv_unwrap<_Tp>::type>
    constexpr _Up&&
    __invfwd(typename remove_reference<_Tp>::type& __t) noexcept
    { return static_cast<_Up&&>(__t); }

  template<typename _Res, typename _Fn, typename... _Args>
    constexpr _Res
    __invoke_impl(__invoke_other, _Fn&& __f, _Args&&... __args)
    { return std::forward<_Fn>(__f)(std::forward<_Args>(__args)...); }

  template<typename _Res, typename _MemFun, typename _Tp, typename... _Args>
    constexpr _Res
    __invoke_impl(__invoke_memfun_ref, _MemFun&& __f, _Tp&& __t,
    _Args&&... __args)
    { return (__invfwd<_Tp>(__t).*__f)(std::forward<_Args>(__args)...); }

  template<typename _Res, typename _MemFun, typename _Tp, typename... _Args>
    constexpr _Res
    __invoke_impl(__invoke_memfun_deref, _MemFun&& __f, _Tp&& __t,
    _Args&&... __args)
    {
      return ((*std::forward<_Tp>(__t)).*__f)(std::forward<_Args>(__args)...);
    }

  template<typename _Res, typename _MemPtr, typename _Tp>
    constexpr _Res
    __invoke_impl(__invoke_memobj_ref, _MemPtr&& __f, _Tp&& __t)
    { return __invfwd<_Tp>(__t).*__f; }

  template<typename _Res, typename _MemPtr, typename _Tp>
    constexpr _Res
    __invoke_impl(__invoke_memobj_deref, _MemPtr&& __f, _Tp&& __t)
    { return (*std::forward<_Tp>(__t)).*__f; }


  template<typename _Callable, typename... _Args>
    constexpr typename __invoke_result<_Callable, _Args...>::type
    __invoke(_Callable&& __fn, _Args&&... __args)
    noexcept(__is_nothrow_invocable<_Callable, _Args...>::value)
    {
      using __result = __invoke_result<_Callable, _Args...>;
      using __type = typename __result::type;
      using __tag = typename __result::__invoke_type;
      return std::__invoke_impl<__type>(__tag{}, std::forward<_Callable>(__fn),
     std::forward<_Args>(__args)...);
    }
# 119 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/invoke.h" 3
  template<typename _Res, typename _Callable, typename... _Args>
    using __can_invoke_as_void = __enable_if_t<
      __and_<is_void<_Res>, __is_invocable<_Callable, _Args...>>::value,
      _Res
    >;

  template<typename _Res, typename _Callable, typename... _Args>
    using __can_invoke_as_nonvoid = __enable_if_t<
      __and_<__not_<is_void<_Res>>,
      is_convertible<typename __invoke_result<_Callable, _Args...>::type,
       _Res>
      >::value,
      _Res
    >;


  template<typename _Res, typename _Callable, typename... _Args>
    constexpr __can_invoke_as_nonvoid<_Res, _Callable, _Args...>
    __invoke_r(_Callable&& __fn, _Args&&... __args)
    {
      using __result = __invoke_result<_Callable, _Args...>;
      using __type = typename __result::type;
      using __tag = typename __result::__invoke_type;
      return std::__invoke_impl<__type>(__tag{}, std::forward<_Callable>(__fn),
     std::forward<_Args>(__args)...);
    }


  template<typename _Res, typename _Callable, typename... _Args>
                         __can_invoke_as_void<_Res, _Callable, _Args...>
    __invoke_r(_Callable&& __fn, _Args&&... __args)
    {
      using __result = __invoke_result<_Callable, _Args...>;
      using __type = typename __result::type;
      using __tag = typename __result::__invoke_type;
      std::__invoke_impl<__type>(__tag{}, std::forward<_Callable>(__fn),
     std::forward<_Args>(__args)...);
    }



}
# 42 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 2 3





namespace std __attribute__ ((__visibility__ ("default")))
{







  template<typename... _Elements>
    class tuple;

  template<typename _Tp>
    struct __is_empty_non_tuple : is_empty<_Tp> { };


  template<typename _El0, typename... _El>
    struct __is_empty_non_tuple<tuple<_El0, _El...>> : false_type { };


  template<typename _Tp>
    using __empty_not_final
    = typename conditional<__is_final(_Tp), false_type,
      __is_empty_non_tuple<_Tp>>::type;

  template<size_t _Idx, typename _Head,
    bool = __empty_not_final<_Head>::value>
    struct _Head_base;


  template<size_t _Idx, typename _Head>
    struct _Head_base<_Idx, _Head, true>
    {
      constexpr _Head_base()
      : _M_head_impl() { }

      constexpr _Head_base(const _Head& __h)
      : _M_head_impl(__h) { }

      constexpr _Head_base(const _Head_base&) = default;
      constexpr _Head_base(_Head_base&&) = default;

      template<typename _UHead>
 constexpr _Head_base(_UHead&& __h)
 : _M_head_impl(std::forward<_UHead>(__h)) { }


      _Head_base(allocator_arg_t, __uses_alloc0)
      : _M_head_impl() { }

      template<typename _Alloc>

 _Head_base(allocator_arg_t, __uses_alloc1<_Alloc> __a)
 : _M_head_impl(allocator_arg, *__a._M_a) { }

      template<typename _Alloc>

 _Head_base(allocator_arg_t, __uses_alloc2<_Alloc> __a)
 : _M_head_impl(*__a._M_a) { }

      template<typename _UHead>

 _Head_base(__uses_alloc0, _UHead&& __uhead)
 : _M_head_impl(std::forward<_UHead>(__uhead)) { }

      template<typename _Alloc, typename _UHead>

 _Head_base(__uses_alloc1<_Alloc> __a, _UHead&& __uhead)
 : _M_head_impl(allocator_arg, *__a._M_a, std::forward<_UHead>(__uhead))
 { }

      template<typename _Alloc, typename _UHead>

 _Head_base(__uses_alloc2<_Alloc> __a, _UHead&& __uhead)
 : _M_head_impl(std::forward<_UHead>(__uhead), *__a._M_a) { }

      static constexpr _Head&
      _M_head(_Head_base& __b) noexcept { return __b._M_head_impl; }

      static constexpr const _Head&
      _M_head(const _Head_base& __b) noexcept { return __b._M_head_impl; }

      [[__no_unique_address__]] _Head _M_head_impl;
    };
# 186 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
  template<size_t _Idx, typename _Head>
    struct _Head_base<_Idx, _Head, false>
    {
      constexpr _Head_base()
      : _M_head_impl() { }

      constexpr _Head_base(const _Head& __h)
      : _M_head_impl(__h) { }

      constexpr _Head_base(const _Head_base&) = default;
      constexpr _Head_base(_Head_base&&) = default;

      template<typename _UHead>
        constexpr _Head_base(_UHead&& __h)
 : _M_head_impl(std::forward<_UHead>(__h)) { }


      _Head_base(allocator_arg_t, __uses_alloc0)
      : _M_head_impl() { }

      template<typename _Alloc>

 _Head_base(allocator_arg_t, __uses_alloc1<_Alloc> __a)
 : _M_head_impl(allocator_arg, *__a._M_a) { }

      template<typename _Alloc>

 _Head_base(allocator_arg_t, __uses_alloc2<_Alloc> __a)
 : _M_head_impl(*__a._M_a) { }

      template<typename _UHead>

 _Head_base(__uses_alloc0, _UHead&& __uhead)
 : _M_head_impl(std::forward<_UHead>(__uhead)) { }

      template<typename _Alloc, typename _UHead>

 _Head_base(__uses_alloc1<_Alloc> __a, _UHead&& __uhead)
 : _M_head_impl(allocator_arg, *__a._M_a, std::forward<_UHead>(__uhead))
 { }

      template<typename _Alloc, typename _UHead>

 _Head_base(__uses_alloc2<_Alloc> __a, _UHead&& __uhead)
 : _M_head_impl(std::forward<_UHead>(__uhead), *__a._M_a) { }

      static constexpr _Head&
      _M_head(_Head_base& __b) noexcept { return __b._M_head_impl; }

      static constexpr const _Head&
      _M_head(const _Head_base& __b) noexcept { return __b._M_head_impl; }

      _Head _M_head_impl;
    };
# 249 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
  template<size_t _Idx, typename... _Elements>
    struct _Tuple_impl;






  template<size_t _Idx, typename _Head, typename... _Tail>
    struct _Tuple_impl<_Idx, _Head, _Tail...>
    : public _Tuple_impl<_Idx + 1, _Tail...>,
      private _Head_base<_Idx, _Head>
    {
      template<size_t, typename...> friend struct _Tuple_impl;

      typedef _Tuple_impl<_Idx + 1, _Tail...> _Inherited;
      typedef _Head_base<_Idx, _Head> _Base;

      static constexpr _Head&
      _M_head(_Tuple_impl& __t) noexcept { return _Base::_M_head(__t); }

      static constexpr const _Head&
      _M_head(const _Tuple_impl& __t) noexcept { return _Base::_M_head(__t); }

      static constexpr _Inherited&
      _M_tail(_Tuple_impl& __t) noexcept { return __t; }

      static constexpr const _Inherited&
      _M_tail(const _Tuple_impl& __t) noexcept { return __t; }

      constexpr _Tuple_impl()
      : _Inherited(), _Base() { }

      explicit constexpr
      _Tuple_impl(const _Head& __head, const _Tail&... __tail)
      : _Inherited(__tail...), _Base(__head)
      { }

      template<typename _UHead, typename... _UTail,
        typename = __enable_if_t<sizeof...(_Tail) == sizeof...(_UTail)>>
 explicit constexpr
 _Tuple_impl(_UHead&& __head, _UTail&&... __tail)
 : _Inherited(std::forward<_UTail>(__tail)...),
   _Base(std::forward<_UHead>(__head))
 { }

      constexpr _Tuple_impl(const _Tuple_impl&) = default;



      _Tuple_impl& operator=(const _Tuple_impl&) = delete;

      _Tuple_impl(_Tuple_impl&&) = default;

      template<typename... _UElements>
 constexpr
 _Tuple_impl(const _Tuple_impl<_Idx, _UElements...>& __in)
 : _Inherited(_Tuple_impl<_Idx, _UElements...>::_M_tail(__in)),
   _Base(_Tuple_impl<_Idx, _UElements...>::_M_head(__in))
 { }

      template<typename _UHead, typename... _UTails>
 constexpr
 _Tuple_impl(_Tuple_impl<_Idx, _UHead, _UTails...>&& __in)
 : _Inherited(std::move
       (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_tail(__in))),
   _Base(std::forward<_UHead>
  (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_head(__in)))
 { }

      template<typename _Alloc>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a)
 : _Inherited(__tag, __a),
   _Base(__tag, __use_alloc<_Head>(__a))
 { }

      template<typename _Alloc>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Head& __head, const _Tail&... __tail)
 : _Inherited(__tag, __a, __tail...),
   _Base(__use_alloc<_Head, _Alloc, _Head>(__a), __head)
 { }

      template<typename _Alloc, typename _UHead, typename... _UTail,
        typename = __enable_if_t<sizeof...(_Tail) == sizeof...(_UTail)>>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _UHead&& __head, _UTail&&... __tail)
 : _Inherited(__tag, __a, std::forward<_UTail>(__tail)...),
   _Base(__use_alloc<_Head, _Alloc, _UHead>(__a),
  std::forward<_UHead>(__head))
 { }

      template<typename _Alloc>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Tuple_impl& __in)
 : _Inherited(__tag, __a, _M_tail(__in)),
   _Base(__use_alloc<_Head, _Alloc, _Head>(__a), _M_head(__in))
 { }

      template<typename _Alloc>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _Tuple_impl&& __in)
 : _Inherited(__tag, __a, std::move(_M_tail(__in))),
   _Base(__use_alloc<_Head, _Alloc, _Head>(__a),
  std::forward<_Head>(_M_head(__in)))
 { }

      template<typename _Alloc, typename _UHead, typename... _UTails>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Tuple_impl<_Idx, _UHead, _UTails...>& __in)
 : _Inherited(__tag, __a,
       _Tuple_impl<_Idx, _UHead, _UTails...>::_M_tail(__in)),
   _Base(__use_alloc<_Head, _Alloc, const _UHead&>(__a),
  _Tuple_impl<_Idx, _UHead, _UTails...>::_M_head(__in))
 { }

      template<typename _Alloc, typename _UHead, typename... _UTails>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _Tuple_impl<_Idx, _UHead, _UTails...>&& __in)
 : _Inherited(__tag, __a, std::move
       (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_tail(__in))),
   _Base(__use_alloc<_Head, _Alloc, _UHead>(__a),
  std::forward<_UHead>
  (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_head(__in)))
 { }

      template<typename... _UElements>

 void
 _M_assign(const _Tuple_impl<_Idx, _UElements...>& __in)
 {
   _M_head(*this) = _Tuple_impl<_Idx, _UElements...>::_M_head(__in);
   _M_tail(*this)._M_assign(
       _Tuple_impl<_Idx, _UElements...>::_M_tail(__in));
 }

      template<typename _UHead, typename... _UTails>

 void
 _M_assign(_Tuple_impl<_Idx, _UHead, _UTails...>&& __in)
 {
   _M_head(*this) = std::forward<_UHead>
     (_Tuple_impl<_Idx, _UHead, _UTails...>::_M_head(__in));
   _M_tail(*this)._M_assign(
       std::move(_Tuple_impl<_Idx, _UHead, _UTails...>::_M_tail(__in)));
 }

    protected:

      void
      _M_swap(_Tuple_impl& __in)
      {
 using std::swap;
 swap(_M_head(*this), _M_head(__in));
 _Inherited::_M_swap(_M_tail(__in));
      }
    };


  template<size_t _Idx, typename _Head>
    struct _Tuple_impl<_Idx, _Head>
    : private _Head_base<_Idx, _Head>
    {
      template<size_t, typename...> friend struct _Tuple_impl;

      typedef _Head_base<_Idx, _Head> _Base;

      static constexpr _Head&
      _M_head(_Tuple_impl& __t) noexcept { return _Base::_M_head(__t); }

      static constexpr const _Head&
      _M_head(const _Tuple_impl& __t) noexcept { return _Base::_M_head(__t); }

      constexpr
      _Tuple_impl()
      : _Base() { }

      explicit constexpr
      _Tuple_impl(const _Head& __head)
      : _Base(__head)
      { }

      template<typename _UHead>
 explicit constexpr
 _Tuple_impl(_UHead&& __head)
 : _Base(std::forward<_UHead>(__head))
 { }

      constexpr _Tuple_impl(const _Tuple_impl&) = default;



      _Tuple_impl& operator=(const _Tuple_impl&) = delete;




      constexpr
      _Tuple_impl(_Tuple_impl&& __in)
      noexcept(is_nothrow_move_constructible<_Head>::value)
      : _Base(static_cast<_Base&&>(__in))
      { }


      template<typename _UHead>
 constexpr
 _Tuple_impl(const _Tuple_impl<_Idx, _UHead>& __in)
 : _Base(_Tuple_impl<_Idx, _UHead>::_M_head(__in))
 { }

      template<typename _UHead>
 constexpr
 _Tuple_impl(_Tuple_impl<_Idx, _UHead>&& __in)
 : _Base(std::forward<_UHead>(_Tuple_impl<_Idx, _UHead>::_M_head(__in)))
 { }

      template<typename _Alloc>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a)
 : _Base(__tag, __use_alloc<_Head>(__a))
 { }

      template<typename _Alloc>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Head& __head)
 : _Base(__use_alloc<_Head, _Alloc, const _Head&>(__a), __head)
 { }

      template<typename _Alloc, typename _UHead>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _UHead&& __head)
 : _Base(__use_alloc<_Head, _Alloc, _UHead>(__a),
  std::forward<_UHead>(__head))
 { }

      template<typename _Alloc>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Tuple_impl& __in)
 : _Base(__use_alloc<_Head, _Alloc, const _Head&>(__a), _M_head(__in))
 { }

      template<typename _Alloc>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _Tuple_impl&& __in)
 : _Base(__use_alloc<_Head, _Alloc, _Head>(__a),
  std::forward<_Head>(_M_head(__in)))
 { }

      template<typename _Alloc, typename _UHead>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      const _Tuple_impl<_Idx, _UHead>& __in)
 : _Base(__use_alloc<_Head, _Alloc, const _UHead&>(__a),
  _Tuple_impl<_Idx, _UHead>::_M_head(__in))
 { }

      template<typename _Alloc, typename _UHead>

 _Tuple_impl(allocator_arg_t __tag, const _Alloc& __a,
      _Tuple_impl<_Idx, _UHead>&& __in)
 : _Base(__use_alloc<_Head, _Alloc, _UHead>(__a),
  std::forward<_UHead>(_Tuple_impl<_Idx, _UHead>::_M_head(__in)))
 { }

      template<typename _UHead>

 void
 _M_assign(const _Tuple_impl<_Idx, _UHead>& __in)
 {
   _M_head(*this) = _Tuple_impl<_Idx, _UHead>::_M_head(__in);
 }

      template<typename _UHead>

 void
 _M_assign(_Tuple_impl<_Idx, _UHead>&& __in)
 {
   _M_head(*this)
     = std::forward<_UHead>(_Tuple_impl<_Idx, _UHead>::_M_head(__in));
 }

    protected:

      void
      _M_swap(_Tuple_impl& __in)
      {
 using std::swap;
 swap(_M_head(*this), _M_head(__in));
      }
    };



  template<bool, typename... _Types>
    struct _TupleConstraints
    {



      template<typename... _UTypes>
 static constexpr bool __is_implicitly_constructible()
 {
   return __and_<is_constructible<_Types, _UTypes>...,
   is_convertible<_UTypes, _Types>...
   >::value;
 }




      template<typename... _UTypes>
 static constexpr bool __is_explicitly_constructible()
 {
   return __and_<is_constructible<_Types, _UTypes>...,
   __not_<__and_<is_convertible<_UTypes, _Types>...>>
   >::value;
 }

      static constexpr bool __is_implicitly_default_constructible()
      {
 return __and_<std::__is_implicitly_default_constructible<_Types>...
        >::value;
      }

      static constexpr bool __is_explicitly_default_constructible()
      {
 return __and_<is_default_constructible<_Types>...,
        __not_<__and_<
   std::__is_implicitly_default_constructible<_Types>...>
        >>::value;
      }
    };



  template<typename... _Types>
    struct _TupleConstraints<false, _Types...>
    {
      template<typename... _UTypes>
 static constexpr bool __is_implicitly_constructible()
 { return false; }

      template<typename... _UTypes>
 static constexpr bool __is_explicitly_constructible()
 { return false; }
    };


  template<typename... _Elements>
    class tuple : public _Tuple_impl<0, _Elements...>
    {
      typedef _Tuple_impl<0, _Elements...> _Inherited;

      template<bool _Cond>
 using _TCC = _TupleConstraints<_Cond, _Elements...>;


      template<bool _Dummy>
 using _ImplicitDefaultCtor = __enable_if_t<
   _TCC<_Dummy>::__is_implicitly_default_constructible(),
   bool>;


      template<bool _Dummy>
 using _ExplicitDefaultCtor = __enable_if_t<
   _TCC<_Dummy>::__is_explicitly_default_constructible(),
   bool>;


      template<bool _Cond, typename... _Args>
 using _ImplicitCtor = __enable_if_t<
   _TCC<_Cond>::template __is_implicitly_constructible<_Args...>(),
   bool>;


      template<bool _Cond, typename... _Args>
 using _ExplicitCtor = __enable_if_t<
   _TCC<_Cond>::template __is_explicitly_constructible<_Args...>(),
   bool>;

      template<typename... _UElements>
 static constexpr
 __enable_if_t<sizeof...(_UElements) == sizeof...(_Elements), bool>
 __assignable()
 { return __and_<is_assignable<_Elements&, _UElements>...>::value; }


      template<typename... _UElements>
 static constexpr bool __nothrow_assignable()
 {
   return
     __and_<is_nothrow_assignable<_Elements&, _UElements>...>::value;
 }


      template<typename... _UElements>
 static constexpr bool __nothrow_constructible()
 {
   return
     __and_<is_nothrow_constructible<_Elements, _UElements>...>::value;
 }


      template<typename _Up>
 static constexpr bool __valid_args()
 {
   return sizeof...(_Elements) == 1
     && !is_same<tuple, __remove_cvref_t<_Up>>::value;
 }


      template<typename, typename, typename... _Tail>
 static constexpr bool __valid_args()
 { return (sizeof...(_Tail) + 2) == sizeof...(_Elements); }
# 684 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
      template<typename _Tuple, typename = tuple,
        typename = __remove_cvref_t<_Tuple>>
 struct _UseOtherCtor
 : false_type
 { };


      template<typename _Tuple, typename _Tp, typename _Up>
 struct _UseOtherCtor<_Tuple, tuple<_Tp>, tuple<_Up>>
 : __or_<is_convertible<_Tuple, _Tp>, is_constructible<_Tp, _Tuple>>
 { };


      template<typename _Tuple, typename _Tp>
 struct _UseOtherCtor<_Tuple, tuple<_Tp>, tuple<_Tp>>
 : true_type
 { };




      template<typename _Tuple>
 static constexpr bool __use_other_ctor()
 { return _UseOtherCtor<_Tuple>::value; }

    public:
      template<typename _Dummy = void,
        _ImplicitDefaultCtor<is_void<_Dummy>::value> = true>
 constexpr
 tuple()
 noexcept(__and_<is_nothrow_default_constructible<_Elements>...>::value)
 : _Inherited() { }

      template<typename _Dummy = void,
        _ExplicitDefaultCtor<is_void<_Dummy>::value> = false>
 explicit constexpr
 tuple()
 noexcept(__and_<is_nothrow_default_constructible<_Elements>...>::value)
 : _Inherited() { }

      template<bool _NotEmpty = (sizeof...(_Elements) >= 1),
        _ImplicitCtor<_NotEmpty, const _Elements&...> = true>
 constexpr
 tuple(const _Elements&... __elements)
 noexcept(__nothrow_constructible<const _Elements&...>())
 : _Inherited(__elements...) { }

      template<bool _NotEmpty = (sizeof...(_Elements) >= 1),
        _ExplicitCtor<_NotEmpty, const _Elements&...> = false>
 explicit constexpr
 tuple(const _Elements&... __elements)
 noexcept(__nothrow_constructible<const _Elements&...>())
 : _Inherited(__elements...) { }

      template<typename... _UElements,
        bool _Valid = __valid_args<_UElements...>(),
        _ImplicitCtor<_Valid, _UElements...> = true>
 constexpr
 tuple(_UElements&&... __elements)
 noexcept(__nothrow_constructible<_UElements...>())
 : _Inherited(std::forward<_UElements>(__elements)...) { }

      template<typename... _UElements,
        bool _Valid = __valid_args<_UElements...>(),
        _ExplicitCtor<_Valid, _UElements...> = false>
 explicit constexpr
 tuple(_UElements&&... __elements)
 noexcept(__nothrow_constructible<_UElements...>())
 : _Inherited(std::forward<_UElements>(__elements)...) { }

      constexpr tuple(const tuple&) = default;

      constexpr tuple(tuple&&) = default;

      template<typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
      && !__use_other_ctor<const tuple<_UElements...>&>(),
        _ImplicitCtor<_Valid, const _UElements&...> = true>
 constexpr
 tuple(const tuple<_UElements...>& __in)
 noexcept(__nothrow_constructible<const _UElements&...>())
 : _Inherited(static_cast<const _Tuple_impl<0, _UElements...>&>(__in))
 { }

      template<typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
      && !__use_other_ctor<const tuple<_UElements...>&>(),
        _ExplicitCtor<_Valid, const _UElements&...> = false>
 explicit constexpr
 tuple(const tuple<_UElements...>& __in)
 noexcept(__nothrow_constructible<const _UElements&...>())
 : _Inherited(static_cast<const _Tuple_impl<0, _UElements...>&>(__in))
 { }

      template<typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<tuple<_UElements...>&&>(),
        _ImplicitCtor<_Valid, _UElements...> = true>
 constexpr
 tuple(tuple<_UElements...>&& __in)
 noexcept(__nothrow_constructible<_UElements...>())
 : _Inherited(static_cast<_Tuple_impl<0, _UElements...>&&>(__in)) { }

      template<typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<tuple<_UElements...>&&>(),
        _ExplicitCtor<_Valid, _UElements...> = false>
 explicit constexpr
 tuple(tuple<_UElements...>&& __in)
 noexcept(__nothrow_constructible<_UElements...>())
 : _Inherited(static_cast<_Tuple_impl<0, _UElements...>&&>(__in)) { }



      template<typename _Alloc,
        _ImplicitDefaultCtor<is_object<_Alloc>::value> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a)
 : _Inherited(__tag, __a) { }

      template<typename _Alloc, bool _NotEmpty = (sizeof...(_Elements) >= 1),
        _ImplicitCtor<_NotEmpty, const _Elements&...> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const _Elements&... __elements)
 : _Inherited(__tag, __a, __elements...) { }

      template<typename _Alloc, bool _NotEmpty = (sizeof...(_Elements) >= 1),
        _ExplicitCtor<_NotEmpty, const _Elements&...> = false>

 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const _Elements&... __elements)
 : _Inherited(__tag, __a, __elements...) { }

      template<typename _Alloc, typename... _UElements,
        bool _Valid = __valid_args<_UElements...>(),
        _ImplicitCtor<_Valid, _UElements...> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       _UElements&&... __elements)
 : _Inherited(__tag, __a, std::forward<_UElements>(__elements)...)
 { }

      template<typename _Alloc, typename... _UElements,
   bool _Valid = __valid_args<_UElements...>(),
        _ExplicitCtor<_Valid, _UElements...> = false>

 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       _UElements&&... __elements)
 : _Inherited(__tag, __a, std::forward<_UElements>(__elements)...)
 { }

      template<typename _Alloc>

 tuple(allocator_arg_t __tag, const _Alloc& __a, const tuple& __in)
 : _Inherited(__tag, __a, static_cast<const _Inherited&>(__in)) { }

      template<typename _Alloc>

 tuple(allocator_arg_t __tag, const _Alloc& __a, tuple&& __in)
 : _Inherited(__tag, __a, static_cast<_Inherited&&>(__in)) { }

      template<typename _Alloc, typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<const tuple<_UElements...>&>(),
        _ImplicitCtor<_Valid, const _UElements&...> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const tuple<_UElements...>& __in)
 : _Inherited(__tag, __a,
              static_cast<const _Tuple_impl<0, _UElements...>&>(__in))
 { }

      template<typename _Alloc, typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<const tuple<_UElements...>&>(),
        _ExplicitCtor<_Valid, const _UElements&...> = false>

 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const tuple<_UElements...>& __in)
 : _Inherited(__tag, __a,
              static_cast<const _Tuple_impl<0, _UElements...>&>(__in))
 { }

      template<typename _Alloc, typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<tuple<_UElements...>&&>(),
        _ImplicitCtor<_Valid, _UElements...> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       tuple<_UElements...>&& __in)
 : _Inherited(__tag, __a,
              static_cast<_Tuple_impl<0, _UElements...>&&>(__in))
 { }

      template<typename _Alloc, typename... _UElements,
        bool _Valid = (sizeof...(_Elements) == sizeof...(_UElements))
        && !__use_other_ctor<tuple<_UElements...>&&>(),
        _ExplicitCtor<_Valid, _UElements...> = false>

 explicit
 tuple(allocator_arg_t __tag, const _Alloc& __a,
       tuple<_UElements...>&& __in)
 : _Inherited(__tag, __a,
              static_cast<_Tuple_impl<0, _UElements...>&&>(__in))
 { }




      tuple&
      operator=(typename conditional<__assignable<const _Elements&...>(),
         const tuple&,
         const __nonesuch&>::type __in)
      noexcept(__nothrow_assignable<const _Elements&...>())
      {
 this->_M_assign(__in);
 return *this;
      }


      tuple&
      operator=(typename conditional<__assignable<_Elements...>(),
         tuple&&,
         __nonesuch&&>::type __in)
      noexcept(__nothrow_assignable<_Elements...>())
      {
 this->_M_assign(std::move(__in));
 return *this;
      }

      template<typename... _UElements>

 __enable_if_t<__assignable<const _UElements&...>(), tuple&>
 operator=(const tuple<_UElements...>& __in)
 noexcept(__nothrow_assignable<const _UElements&...>())
 {
   this->_M_assign(__in);
   return *this;
 }

      template<typename... _UElements>

 __enable_if_t<__assignable<_UElements...>(), tuple&>
 operator=(tuple<_UElements...>&& __in)
 noexcept(__nothrow_assignable<_UElements...>())
 {
   this->_M_assign(std::move(__in));
   return *this;
 }



      void
      swap(tuple& __in)
      noexcept(__and_<__is_nothrow_swappable<_Elements>...>::value)
      { _Inherited::_M_swap(__in); }
    };
# 960 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
  template<>
    class tuple<>
    {
    public:

      void swap(tuple&) noexcept { }


      tuple() = default;

      template<typename _Alloc>

 tuple(allocator_arg_t, const _Alloc&) noexcept { }
      template<typename _Alloc>

 tuple(allocator_arg_t, const _Alloc&, const tuple&) noexcept { }
    };



  template<typename _T1, typename _T2>
    class tuple<_T1, _T2> : public _Tuple_impl<0, _T1, _T2>
    {
      typedef _Tuple_impl<0, _T1, _T2> _Inherited;


      template<bool _Dummy, typename _U1, typename _U2>
 using _ImplicitDefaultCtor = __enable_if_t<
   _TupleConstraints<_Dummy, _U1, _U2>::
     __is_implicitly_default_constructible(),
   bool>;


      template<bool _Dummy, typename _U1, typename _U2>
 using _ExplicitDefaultCtor = __enable_if_t<
   _TupleConstraints<_Dummy, _U1, _U2>::
     __is_explicitly_default_constructible(),
   bool>;

      template<bool _Dummy>
 using _TCC = _TupleConstraints<_Dummy, _T1, _T2>;


      template<bool _Cond, typename _U1, typename _U2>
 using _ImplicitCtor = __enable_if_t<
   _TCC<_Cond>::template __is_implicitly_constructible<_U1, _U2>(),
   bool>;


      template<bool _Cond, typename _U1, typename _U2>
 using _ExplicitCtor = __enable_if_t<
   _TCC<_Cond>::template __is_explicitly_constructible<_U1, _U2>(),
   bool>;

      template<typename _U1, typename _U2>
 static constexpr bool __assignable()
 {
   return __and_<is_assignable<_T1&, _U1>,
   is_assignable<_T2&, _U2>>::value;
 }

      template<typename _U1, typename _U2>
 static constexpr bool __nothrow_assignable()
 {
   return __and_<is_nothrow_assignable<_T1&, _U1>,
   is_nothrow_assignable<_T2&, _U2>>::value;
 }

      template<typename _U1, typename _U2>
 static constexpr bool __nothrow_constructible()
 {
   return __and_<is_nothrow_constructible<_T1, _U1>,
       is_nothrow_constructible<_T2, _U2>>::value;
 }

      static constexpr bool __nothrow_default_constructible()
      {
 return __and_<is_nothrow_default_constructible<_T1>,
        is_nothrow_default_constructible<_T2>>::value;
      }

      template<typename _U1>
 static constexpr bool __is_alloc_arg()
 { return is_same<__remove_cvref_t<_U1>, allocator_arg_t>::value; }

    public:
      template<bool _Dummy = true,
        _ImplicitDefaultCtor<_Dummy, _T1, _T2> = true>
 constexpr
 tuple()
 noexcept(__nothrow_default_constructible())
 : _Inherited() { }

      template<bool _Dummy = true,
        _ExplicitDefaultCtor<_Dummy, _T1, _T2> = false>
 explicit constexpr
 tuple()
 noexcept(__nothrow_default_constructible())
 : _Inherited() { }

      template<bool _Dummy = true,
        _ImplicitCtor<_Dummy, const _T1&, const _T2&> = true>
 constexpr
 tuple(const _T1& __a1, const _T2& __a2)
 noexcept(__nothrow_constructible<const _T1&, const _T2&>())
 : _Inherited(__a1, __a2) { }

      template<bool _Dummy = true,
        _ExplicitCtor<_Dummy, const _T1&, const _T2&> = false>
 explicit constexpr
 tuple(const _T1& __a1, const _T2& __a2)
 noexcept(__nothrow_constructible<const _T1&, const _T2&>())
 : _Inherited(__a1, __a2) { }

      template<typename _U1, typename _U2,
        _ImplicitCtor<!__is_alloc_arg<_U1>(), _U1, _U2> = true>
 constexpr
 tuple(_U1&& __a1, _U2&& __a2)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(std::forward<_U1>(__a1), std::forward<_U2>(__a2)) { }

      template<typename _U1, typename _U2,
        _ExplicitCtor<!__is_alloc_arg<_U1>(), _U1, _U2> = false>
 explicit constexpr
 tuple(_U1&& __a1, _U2&& __a2)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(std::forward<_U1>(__a1), std::forward<_U2>(__a2)) { }

      constexpr tuple(const tuple&) = default;

      constexpr tuple(tuple&&) = default;

      template<typename _U1, typename _U2,
        _ImplicitCtor<true, const _U1&, const _U2&> = true>
 constexpr
 tuple(const tuple<_U1, _U2>& __in)
 noexcept(__nothrow_constructible<const _U1&, const _U2&>())
 : _Inherited(static_cast<const _Tuple_impl<0, _U1, _U2>&>(__in)) { }

      template<typename _U1, typename _U2,
        _ExplicitCtor<true, const _U1&, const _U2&> = false>
 explicit constexpr
 tuple(const tuple<_U1, _U2>& __in)
 noexcept(__nothrow_constructible<const _U1&, const _U2&>())
 : _Inherited(static_cast<const _Tuple_impl<0, _U1, _U2>&>(__in)) { }

      template<typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>
 constexpr
 tuple(tuple<_U1, _U2>&& __in)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(static_cast<_Tuple_impl<0, _U1, _U2>&&>(__in)) { }

      template<typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit constexpr
 tuple(tuple<_U1, _U2>&& __in)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(static_cast<_Tuple_impl<0, _U1, _U2>&&>(__in)) { }

      template<typename _U1, typename _U2,
        _ImplicitCtor<true, const _U1&, const _U2&> = true>
 constexpr
 tuple(const pair<_U1, _U2>& __in)
 noexcept(__nothrow_constructible<const _U1&, const _U2&>())
 : _Inherited(__in.first, __in.second) { }

      template<typename _U1, typename _U2,
        _ExplicitCtor<true, const _U1&, const _U2&> = false>
 explicit constexpr
 tuple(const pair<_U1, _U2>& __in)
 noexcept(__nothrow_constructible<const _U1&, const _U2&>())
 : _Inherited(__in.first, __in.second) { }

      template<typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>
 constexpr
 tuple(pair<_U1, _U2>&& __in)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(std::forward<_U1>(__in.first),
       std::forward<_U2>(__in.second)) { }

      template<typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit constexpr
 tuple(pair<_U1, _U2>&& __in)
 noexcept(__nothrow_constructible<_U1, _U2>())
 : _Inherited(std::forward<_U1>(__in.first),
       std::forward<_U2>(__in.second)) { }



      template<typename _Alloc,
        _ImplicitDefaultCtor<is_object<_Alloc>::value, _T1, _T2> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a)
 : _Inherited(__tag, __a) { }

      template<typename _Alloc, bool _Dummy = true,
        _ImplicitCtor<_Dummy, const _T1&, const _T2&> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const _T1& __a1, const _T2& __a2)
 : _Inherited(__tag, __a, __a1, __a2) { }

      template<typename _Alloc, bool _Dummy = true,
        _ExplicitCtor<_Dummy, const _T1&, const _T2&> = false>
 explicit

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const _T1& __a1, const _T2& __a2)
 : _Inherited(__tag, __a, __a1, __a2) { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a, _U1&& __a1, _U2&& __a2)
 : _Inherited(__tag, __a, std::forward<_U1>(__a1),
              std::forward<_U2>(__a2)) { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       _U1&& __a1, _U2&& __a2)
 : _Inherited(__tag, __a, std::forward<_U1>(__a1),
              std::forward<_U2>(__a2)) { }

      template<typename _Alloc>

 tuple(allocator_arg_t __tag, const _Alloc& __a, const tuple& __in)
 : _Inherited(__tag, __a, static_cast<const _Inherited&>(__in)) { }

      template<typename _Alloc>

 tuple(allocator_arg_t __tag, const _Alloc& __a, tuple&& __in)
 : _Inherited(__tag, __a, static_cast<_Inherited&&>(__in)) { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, const _U1&, const _U2&> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const tuple<_U1, _U2>& __in)
 : _Inherited(__tag, __a,
              static_cast<const _Tuple_impl<0, _U1, _U2>&>(__in))
 { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, const _U1&, const _U2&> = false>
 explicit

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const tuple<_U1, _U2>& __in)
 : _Inherited(__tag, __a,
              static_cast<const _Tuple_impl<0, _U1, _U2>&>(__in))
 { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a, tuple<_U1, _U2>&& __in)
 : _Inherited(__tag, __a, static_cast<_Tuple_impl<0, _U1, _U2>&&>(__in))
 { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit

 tuple(allocator_arg_t __tag, const _Alloc& __a, tuple<_U1, _U2>&& __in)
 : _Inherited(__tag, __a, static_cast<_Tuple_impl<0, _U1, _U2>&&>(__in))
 { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, const _U1&, const _U2&> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const pair<_U1, _U2>& __in)
 : _Inherited(__tag, __a, __in.first, __in.second) { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, const _U1&, const _U2&> = false>
 explicit

 tuple(allocator_arg_t __tag, const _Alloc& __a,
       const pair<_U1, _U2>& __in)
 : _Inherited(__tag, __a, __in.first, __in.second) { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ImplicitCtor<true, _U1, _U2> = true>

 tuple(allocator_arg_t __tag, const _Alloc& __a, pair<_U1, _U2>&& __in)
 : _Inherited(__tag, __a, std::forward<_U1>(__in.first),
       std::forward<_U2>(__in.second)) { }

      template<typename _Alloc, typename _U1, typename _U2,
        _ExplicitCtor<true, _U1, _U2> = false>
 explicit

 tuple(allocator_arg_t __tag, const _Alloc& __a, pair<_U1, _U2>&& __in)
 : _Inherited(__tag, __a, std::forward<_U1>(__in.first),
       std::forward<_U2>(__in.second)) { }




      tuple&
      operator=(typename conditional<__assignable<const _T1&, const _T2&>(),
         const tuple&,
         const __nonesuch&>::type __in)
      noexcept(__nothrow_assignable<const _T1&, const _T2&>())
      {
 this->_M_assign(__in);
 return *this;
      }


      tuple&
      operator=(typename conditional<__assignable<_T1, _T2>(),
         tuple&&,
         __nonesuch&&>::type __in)
      noexcept(__nothrow_assignable<_T1, _T2>())
      {
 this->_M_assign(std::move(__in));
 return *this;
      }

      template<typename _U1, typename _U2>

 __enable_if_t<__assignable<const _U1&, const _U2&>(), tuple&>
 operator=(const tuple<_U1, _U2>& __in)
 noexcept(__nothrow_assignable<const _U1&, const _U2&>())
 {
   this->_M_assign(__in);
   return *this;
 }

      template<typename _U1, typename _U2>

 __enable_if_t<__assignable<_U1, _U2>(), tuple&>
 operator=(tuple<_U1, _U2>&& __in)
 noexcept(__nothrow_assignable<_U1, _U2>())
 {
   this->_M_assign(std::move(__in));
   return *this;
 }

      template<typename _U1, typename _U2>

 __enable_if_t<__assignable<const _U1&, const _U2&>(), tuple&>
 operator=(const pair<_U1, _U2>& __in)
 noexcept(__nothrow_assignable<const _U1&, const _U2&>())
 {
   this->_M_head(*this) = __in.first;
   this->_M_tail(*this)._M_head(*this) = __in.second;
   return *this;
 }

      template<typename _U1, typename _U2>

 __enable_if_t<__assignable<_U1, _U2>(), tuple&>
 operator=(pair<_U1, _U2>&& __in)
 noexcept(__nothrow_assignable<_U1, _U2>())
 {
   this->_M_head(*this) = std::forward<_U1>(__in.first);
   this->_M_tail(*this)._M_head(*this) = std::forward<_U2>(__in.second);
   return *this;
 }


      void
      swap(tuple& __in)
      noexcept(__and_<__is_nothrow_swappable<_T1>,
        __is_nothrow_swappable<_T2>>::value)
      { _Inherited::_M_swap(__in); }
    };



  template<typename... _Elements>
    struct tuple_size<tuple<_Elements...>>
    : public integral_constant<size_t, sizeof...(_Elements)> { };
# 1352 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
  template<size_t __i, typename _Head, typename... _Tail>
    struct tuple_element<__i, tuple<_Head, _Tail...> >
    : tuple_element<__i - 1, tuple<_Tail...> > { };




  template<typename _Head, typename... _Tail>
    struct tuple_element<0, tuple<_Head, _Tail...> >
    {
      typedef _Head type;
    };




  template<size_t __i>
    struct tuple_element<__i, tuple<>>
    {
      static_assert(__i < tuple_size<tuple<>>::value,
   "tuple index must be in range");
    };

  template<size_t __i, typename _Head, typename... _Tail>
    constexpr _Head&
    __get_helper(_Tuple_impl<__i, _Head, _Tail...>& __t) noexcept
    { return _Tuple_impl<__i, _Head, _Tail...>::_M_head(__t); }

  template<size_t __i, typename _Head, typename... _Tail>
    constexpr const _Head&
    __get_helper(const _Tuple_impl<__i, _Head, _Tail...>& __t) noexcept
    { return _Tuple_impl<__i, _Head, _Tail...>::_M_head(__t); }


  template<size_t __i, typename... _Types>
    __enable_if_t<(__i >= sizeof...(_Types))>
    __get_helper(const tuple<_Types...>&) = delete;


  template<size_t __i, typename... _Elements>
    constexpr __tuple_element_t<__i, tuple<_Elements...>>&
    get(tuple<_Elements...>& __t) noexcept
    { return std::__get_helper<__i>(__t); }


  template<size_t __i, typename... _Elements>
    constexpr const __tuple_element_t<__i, tuple<_Elements...>>&
    get(const tuple<_Elements...>& __t) noexcept
    { return std::__get_helper<__i>(__t); }


  template<size_t __i, typename... _Elements>
    constexpr __tuple_element_t<__i, tuple<_Elements...>>&&
    get(tuple<_Elements...>&& __t) noexcept
    {
      typedef __tuple_element_t<__i, tuple<_Elements...>> __element_type;
      return std::forward<__element_type>(std::__get_helper<__i>(__t));
    }


  template<size_t __i, typename... _Elements>
    constexpr const __tuple_element_t<__i, tuple<_Elements...>>&&
    get(const tuple<_Elements...>&& __t) noexcept
    {
      typedef __tuple_element_t<__i, tuple<_Elements...>> __element_type;
      return std::forward<const __element_type>(std::__get_helper<__i>(__t));
    }
# 1493 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
  template<typename _Tp, typename _Up, size_t __i, size_t __size>
    struct __tuple_compare
    {
      static constexpr bool
      __eq(const _Tp& __t, const _Up& __u)
      {
 return bool(std::get<__i>(__t) == std::get<__i>(__u))
   && __tuple_compare<_Tp, _Up, __i + 1, __size>::__eq(__t, __u);
      }

      static constexpr bool
      __less(const _Tp& __t, const _Up& __u)
      {
 return bool(std::get<__i>(__t) < std::get<__i>(__u))
   || (!bool(std::get<__i>(__u) < std::get<__i>(__t))
       && __tuple_compare<_Tp, _Up, __i + 1, __size>::__less(__t, __u));
      }
    };

  template<typename _Tp, typename _Up, size_t __size>
    struct __tuple_compare<_Tp, _Up, __size, __size>
    {
      static constexpr bool
      __eq(const _Tp&, const _Up&) { return true; }

      static constexpr bool
      __less(const _Tp&, const _Up&) { return false; }
    };

  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator==(const tuple<_TElements...>& __t,
        const tuple<_UElements...>& __u)
    {
      static_assert(sizeof...(_TElements) == sizeof...(_UElements),
   "tuple objects can only be compared if they have equal sizes.");
      using __compare = __tuple_compare<tuple<_TElements...>,
     tuple<_UElements...>,
     0, sizeof...(_TElements)>;
      return __compare::__eq(__t, __u);
    }
# 1564 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator<(const tuple<_TElements...>& __t,
       const tuple<_UElements...>& __u)
    {
      static_assert(sizeof...(_TElements) == sizeof...(_UElements),
   "tuple objects can only be compared if they have equal sizes.");
      using __compare = __tuple_compare<tuple<_TElements...>,
     tuple<_UElements...>,
     0, sizeof...(_TElements)>;
      return __compare::__less(__t, __u);
    }

  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator!=(const tuple<_TElements...>& __t,
        const tuple<_UElements...>& __u)
    { return !(__t == __u); }

  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator>(const tuple<_TElements...>& __t,
       const tuple<_UElements...>& __u)
    { return __u < __t; }

  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator<=(const tuple<_TElements...>& __t,
        const tuple<_UElements...>& __u)
    { return !(__u < __t); }

  template<typename... _TElements, typename... _UElements>
    constexpr bool
    operator>=(const tuple<_TElements...>& __t,
        const tuple<_UElements...>& __u)
    { return !(__t < __u); }



  template<typename... _Elements>
    constexpr tuple<typename __decay_and_strip<_Elements>::__type...>
    make_tuple(_Elements&&... __args)
    {
      typedef tuple<typename __decay_and_strip<_Elements>::__type...>
 __result_type;
      return __result_type(std::forward<_Elements>(__args)...);
    }




  template<typename... _Elements>
    constexpr tuple<_Elements&&...>
    forward_as_tuple(_Elements&&... __args) noexcept
    { return tuple<_Elements&&...>(std::forward<_Elements>(__args)...); }

  template<size_t, typename, typename, size_t>
    struct __make_tuple_impl;

  template<size_t _Idx, typename _Tuple, typename... _Tp, size_t _Nm>
    struct __make_tuple_impl<_Idx, tuple<_Tp...>, _Tuple, _Nm>
    : __make_tuple_impl<_Idx + 1,
   tuple<_Tp..., __tuple_element_t<_Idx, _Tuple>>,
   _Tuple, _Nm>
    { };

  template<size_t _Nm, typename _Tuple, typename... _Tp>
    struct __make_tuple_impl<_Nm, tuple<_Tp...>, _Tuple, _Nm>
    {
      typedef tuple<_Tp...> __type;
    };

  template<typename _Tuple>
    struct __do_make_tuple
    : __make_tuple_impl<0, tuple<>, _Tuple, tuple_size<_Tuple>::value>
    { };


  template<typename _Tuple>
    struct __make_tuple
    : public __do_make_tuple<__remove_cvref_t<_Tuple>>
    { };


  template<typename...>
    struct __combine_tuples;

  template<>
    struct __combine_tuples<>
    {
      typedef tuple<> __type;
    };

  template<typename... _Ts>
    struct __combine_tuples<tuple<_Ts...>>
    {
      typedef tuple<_Ts...> __type;
    };

  template<typename... _T1s, typename... _T2s, typename... _Rem>
    struct __combine_tuples<tuple<_T1s...>, tuple<_T2s...>, _Rem...>
    {
      typedef typename __combine_tuples<tuple<_T1s..., _T2s...>,
     _Rem...>::__type __type;
    };


  template<typename... _Tpls>
    struct __tuple_cat_result
    {
      typedef typename __combine_tuples
        <typename __make_tuple<_Tpls>::__type...>::__type __type;
    };



  template<typename...>
    struct __make_1st_indices;

  template<>
    struct __make_1st_indices<>
    {
      typedef _Index_tuple<> __type;
    };

  template<typename _Tp, typename... _Tpls>
    struct __make_1st_indices<_Tp, _Tpls...>
    {
      typedef typename _Build_index_tuple<tuple_size<
 typename remove_reference<_Tp>::type>::value>::__type __type;
    };




  template<typename _Ret, typename _Indices, typename... _Tpls>
    struct __tuple_concater;

  template<typename _Ret, size_t... _Is, typename _Tp, typename... _Tpls>
    struct __tuple_concater<_Ret, _Index_tuple<_Is...>, _Tp, _Tpls...>
    {
      template<typename... _Us>
        static constexpr _Ret
        _S_do(_Tp&& __tp, _Tpls&&... __tps, _Us&&... __us)
        {
   typedef typename __make_1st_indices<_Tpls...>::__type __idx;
   typedef __tuple_concater<_Ret, __idx, _Tpls...> __next;
   return __next::_S_do(std::forward<_Tpls>(__tps)...,
          std::forward<_Us>(__us)...,
          std::get<_Is>(std::forward<_Tp>(__tp))...);
 }
    };

  template<typename _Ret>
    struct __tuple_concater<_Ret, _Index_tuple<>>
    {
      template<typename... _Us>
 static constexpr _Ret
 _S_do(_Us&&... __us)
        {
   return _Ret(std::forward<_Us>(__us)...);
 }
    };


  template<typename... _Tpls, typename = typename
           enable_if<__and_<__is_tuple_like<_Tpls>...>::value>::type>
    constexpr auto
    tuple_cat(_Tpls&&... __tpls)
    -> typename __tuple_cat_result<_Tpls...>::__type
    {
      typedef typename __tuple_cat_result<_Tpls...>::__type __ret;
      typedef typename __make_1st_indices<_Tpls...>::__type __idx;
      typedef __tuple_concater<__ret, __idx, _Tpls...> __concater;
      return __concater::_S_do(std::forward<_Tpls>(__tpls)...);
    }




  template<typename... _Elements>
    constexpr tuple<_Elements&...>
    tie(_Elements&... __args) noexcept
    { return tuple<_Elements&...>(__args...); }


  template<typename... _Elements>

    inline





    void

    swap(tuple<_Elements...>& __x, tuple<_Elements...>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }
# 1775 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
  struct _Swallow_assign
  {
    template<class _Tp>
                           const _Swallow_assign&
      operator=(const _Tp&) const
      { return *this; }
  };



                    constexpr _Swallow_assign ignore{};


  template<typename... _Types, typename _Alloc>
    struct uses_allocator<tuple<_Types...>, _Alloc> : true_type { };
# 1800 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
  template<class _T1, class _T2>
    template<typename... _Args1, typename... _Args2>

      inline
      pair<_T1, _T2>::
      pair(piecewise_construct_t,
    tuple<_Args1...> __first, tuple<_Args2...> __second)
      : pair(__first, __second,
      typename _Build_index_tuple<sizeof...(_Args1)>::__type(),
      typename _Build_index_tuple<sizeof...(_Args2)>::__type())
      { }

  template<class _T1, class _T2>
    template<typename... _Args1, size_t... _Indexes1,
      typename... _Args2, size_t... _Indexes2>
                           inline
      pair<_T1, _T2>::
      pair(tuple<_Args1...>& __tuple1, tuple<_Args2...>& __tuple2,
    _Index_tuple<_Indexes1...>, _Index_tuple<_Indexes2...>)
      : first(std::forward<_Args1>(std::get<_Indexes1>(__tuple1))...),
 second(std::forward<_Args2>(std::get<_Indexes2>(__tuple2))...)
      { }
# 1891 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple" 3
}
# 35 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 2 3



namespace std __attribute__ ((__visibility__ ("default")))
{



  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    class _Hashtable;

namespace __detail
{





  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Equal, typename _Hash, typename _RangeHash,
    typename _Unused, typename _Traits>
    struct _Hashtable_base;



  template<class _Iterator>
    inline typename std::iterator_traits<_Iterator>::difference_type
    __distance_fw(_Iterator __first, _Iterator __last,
    std::input_iterator_tag)
    { return __first != __last ? 1 : 0; }

  template<class _Iterator>
    inline typename std::iterator_traits<_Iterator>::difference_type
    __distance_fw(_Iterator __first, _Iterator __last,
    std::forward_iterator_tag)
    { return std::distance(__first, __last); }

  template<class _Iterator>
    inline typename std::iterator_traits<_Iterator>::difference_type
    __distance_fw(_Iterator __first, _Iterator __last)
    { return __distance_fw(__first, __last,
      std::__iterator_category(__first)); }

  struct _Identity
  {
    template<typename _Tp>
      _Tp&&
      operator()(_Tp&& __x) const noexcept
      { return std::forward<_Tp>(__x); }
  };

  struct _Select1st
  {
    template<typename _Tp>
      auto
      operator()(_Tp&& __x) const noexcept
      -> decltype(std::get<0>(std::forward<_Tp>(__x)))
      { return std::get<0>(std::forward<_Tp>(__x)); }
  };

  template<typename _NodeAlloc>
    struct _Hashtable_alloc;



  template<typename _NodeAlloc>
    struct _ReuseOrAllocNode
    {
    private:
      using __node_alloc_type = _NodeAlloc;
      using __hashtable_alloc = _Hashtable_alloc<__node_alloc_type>;
      using __node_alloc_traits =
 typename __hashtable_alloc::__node_alloc_traits;
      using __node_type = typename __hashtable_alloc::__node_type;

    public:
      _ReuseOrAllocNode(__node_type* __nodes, __hashtable_alloc& __h)
      : _M_nodes(__nodes), _M_h(__h) { }
      _ReuseOrAllocNode(const _ReuseOrAllocNode&) = delete;

      ~_ReuseOrAllocNode()
      { _M_h._M_deallocate_nodes(_M_nodes); }

      template<typename _Arg>
 __node_type*
 operator()(_Arg&& __arg) const
 {
   if (_M_nodes)
     {
       __node_type* __node = _M_nodes;
       _M_nodes = _M_nodes->_M_next();
       __node->_M_nxt = nullptr;
       auto& __a = _M_h._M_node_allocator();
       __node_alloc_traits::destroy(__a, __node->_M_valptr());
       try
  {
    __node_alloc_traits::construct(__a, __node->_M_valptr(),
       std::forward<_Arg>(__arg));
  }
       catch(...)
  {
    _M_h._M_deallocate_node_ptr(__node);
    throw;
  }
       return __node;
     }
   return _M_h._M_allocate_node(std::forward<_Arg>(__arg));
 }

    private:
      mutable __node_type* _M_nodes;
      __hashtable_alloc& _M_h;
    };



  template<typename _NodeAlloc>
    struct _AllocNode
    {
    private:
      using __hashtable_alloc = _Hashtable_alloc<_NodeAlloc>;
      using __node_type = typename __hashtable_alloc::__node_type;

    public:
      _AllocNode(__hashtable_alloc& __h)
      : _M_h(__h) { }

      template<typename _Arg>
 __node_type*
 operator()(_Arg&& __arg) const
 { return _M_h._M_allocate_node(std::forward<_Arg>(__arg)); }

    private:
      __hashtable_alloc& _M_h;
    };
# 199 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 3
  template<bool _Cache_hash_code, bool _Constant_iterators, bool _Unique_keys>
    struct _Hashtable_traits
    {
      using __hash_cached = __bool_constant<_Cache_hash_code>;
      using __constant_iterators = __bool_constant<_Constant_iterators>;
      using __unique_keys = __bool_constant<_Unique_keys>;
    };
# 215 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 3
  struct _Hash_node_base
  {
    _Hash_node_base* _M_nxt;

    _Hash_node_base() noexcept : _M_nxt() { }

    _Hash_node_base(_Hash_node_base* __next) noexcept : _M_nxt(__next) { }
  };






  template<typename _Value>
    struct _Hash_node_value_base
    {
      typedef _Value value_type;

      __gnu_cxx::__aligned_buffer<_Value> _M_storage;

      _Value*
      _M_valptr() noexcept
      { return _M_storage._M_ptr(); }

      const _Value*
      _M_valptr() const noexcept
      { return _M_storage._M_ptr(); }

      _Value&
      _M_v() noexcept
      { return *_M_valptr(); }

      const _Value&
      _M_v() const noexcept
      { return *_M_valptr(); }
    };




  template<bool _Cache_hash_code>
    struct _Hash_node_code_cache
    { };




  template<>
    struct _Hash_node_code_cache<true>
    { std::size_t _M_hash_code; };

  template<typename _Value, bool _Cache_hash_code>
    struct _Hash_node_value
    : _Hash_node_value_base<_Value>
    , _Hash_node_code_cache<_Cache_hash_code>
    { };




  template<typename _Value, bool _Cache_hash_code>
    struct _Hash_node
    : _Hash_node_base
    , _Hash_node_value<_Value, _Cache_hash_code>
    {
      _Hash_node*
      _M_next() const noexcept
      { return static_cast<_Hash_node*>(this->_M_nxt); }
    };


  template<typename _Value, bool _Cache_hash_code>
    struct _Node_iterator_base
    {
      using __node_type = _Hash_node<_Value, _Cache_hash_code>;

      __node_type* _M_cur;

      _Node_iterator_base() : _M_cur(nullptr) { }
      _Node_iterator_base(__node_type* __p) noexcept
      : _M_cur(__p) { }

      void
      _M_incr() noexcept
      { _M_cur = _M_cur->_M_next(); }

      friend bool
      operator==(const _Node_iterator_base& __x, const _Node_iterator_base& __y)
      noexcept
      { return __x._M_cur == __y._M_cur; }


      friend bool
      operator!=(const _Node_iterator_base& __x, const _Node_iterator_base& __y)
      noexcept
      { return __x._M_cur != __y._M_cur; }

    };


  template<typename _Value, bool __constant_iterators, bool __cache>
    struct _Node_iterator
    : public _Node_iterator_base<_Value, __cache>
    {
    private:
      using __base_type = _Node_iterator_base<_Value, __cache>;
      using __node_type = typename __base_type::__node_type;

    public:
      typedef _Value value_type;
      typedef std::ptrdiff_t difference_type;
      typedef std::forward_iterator_tag iterator_category;

      using pointer = typename std::conditional<__constant_iterators,
      const value_type*, value_type*>::type;

      using reference = typename std::conditional<__constant_iterators,
      const value_type&, value_type&>::type;

      _Node_iterator() = default;

      explicit
      _Node_iterator(__node_type* __p) noexcept
      : __base_type(__p) { }

      reference
      operator*() const noexcept
      { return this->_M_cur->_M_v(); }

      pointer
      operator->() const noexcept
      { return this->_M_cur->_M_valptr(); }

      _Node_iterator&
      operator++() noexcept
      {
 this->_M_incr();
 return *this;
      }

      _Node_iterator
      operator++(int) noexcept
      {
 _Node_iterator __tmp(*this);
 this->_M_incr();
 return __tmp;
      }
    };


  template<typename _Value, bool __constant_iterators, bool __cache>
    struct _Node_const_iterator
    : public _Node_iterator_base<_Value, __cache>
    {
    private:
      using __base_type = _Node_iterator_base<_Value, __cache>;
      using __node_type = typename __base_type::__node_type;

    public:
      typedef _Value value_type;
      typedef std::ptrdiff_t difference_type;
      typedef std::forward_iterator_tag iterator_category;

      typedef const value_type* pointer;
      typedef const value_type& reference;

      _Node_const_iterator() = default;

      explicit
      _Node_const_iterator(__node_type* __p) noexcept
      : __base_type(__p) { }

      _Node_const_iterator(const _Node_iterator<_Value, __constant_iterators,
      __cache>& __x) noexcept
      : __base_type(__x._M_cur) { }

      reference
      operator*() const noexcept
      { return this->_M_cur->_M_v(); }

      pointer
      operator->() const noexcept
      { return this->_M_cur->_M_valptr(); }

      _Node_const_iterator&
      operator++() noexcept
      {
 this->_M_incr();
 return *this;
      }

      _Node_const_iterator
      operator++(int) noexcept
      {
 _Node_const_iterator __tmp(*this);
 this->_M_incr();
 return __tmp;
      }
    };






  struct _Mod_range_hashing
  {
    typedef std::size_t first_argument_type;
    typedef std::size_t second_argument_type;
    typedef std::size_t result_type;

    result_type
    operator()(first_argument_type __num,
        second_argument_type __den) const noexcept
    { return __num % __den; }
  };






  struct _Default_ranged_hash { };



  struct _Prime_rehash_policy
  {
    using __has_load_factor = true_type;

    _Prime_rehash_policy(float __z = 1.0) noexcept
    : _M_max_load_factor(__z), _M_next_resize(0) { }

    float
    max_load_factor() const noexcept
    { return _M_max_load_factor; }


    std::size_t
    _M_next_bkt(std::size_t __n) const;


    std::size_t
    _M_bkt_for_elements(std::size_t __n) const
    { return __builtin_ceil(__n / (double)_M_max_load_factor); }





    std::pair<bool, std::size_t>
    _M_need_rehash(std::size_t __n_bkt, std::size_t __n_elt,
     std::size_t __n_ins) const;

    typedef std::size_t _State;

    _State
    _M_state() const
    { return _M_next_resize; }

    void
    _M_reset() noexcept
    { _M_next_resize = 0; }

    void
    _M_reset(_State __state)
    { _M_next_resize = __state; }

    static const std::size_t _S_growth_factor = 2;

    float _M_max_load_factor;
    mutable std::size_t _M_next_resize;
  };


  struct _Mask_range_hashing
  {
    typedef std::size_t first_argument_type;
    typedef std::size_t second_argument_type;
    typedef std::size_t result_type;

    result_type
    operator()(first_argument_type __num,
        second_argument_type __den) const noexcept
    { return __num & (__den - 1); }
  };


  inline std::size_t
  __clp2(std::size_t __n) noexcept
  {
    using __gnu_cxx::__int_traits;

    if (__n < 2)
      return __n;
    const unsigned __lz = sizeof(size_t) > sizeof(long)
      ? __builtin_clzll(__n - 1ull)
      : __builtin_clzl(__n - 1ul);

    return (size_t(1) << (__int_traits<size_t>::__digits - __lz - 1)) << 1;
  }



  struct _Power2_rehash_policy
  {
    using __has_load_factor = true_type;

    _Power2_rehash_policy(float __z = 1.0) noexcept
    : _M_max_load_factor(__z), _M_next_resize(0) { }

    float
    max_load_factor() const noexcept
    { return _M_max_load_factor; }



    std::size_t
    _M_next_bkt(std::size_t __n) noexcept
    {
      if (__n == 0)



 return 1;

      const auto __max_width = std::min<size_t>(sizeof(size_t), 8);
      const auto __max_bkt = size_t(1) << (__max_width * 8 - 1);
      std::size_t __res = __clp2(__n);

      if (__res == 0)
 __res = __max_bkt;
      else if (__res == 1)



 __res = 2;

      if (__res == __max_bkt)



 _M_next_resize = size_t(-1);
      else
 _M_next_resize
   = __builtin_floor(__res * (double)_M_max_load_factor);

      return __res;
    }


    std::size_t
    _M_bkt_for_elements(std::size_t __n) const noexcept
    { return __builtin_ceil(__n / (double)_M_max_load_factor); }





    std::pair<bool, std::size_t>
    _M_need_rehash(std::size_t __n_bkt, std::size_t __n_elt,
     std::size_t __n_ins) noexcept
    {
      if (__n_elt + __n_ins > _M_next_resize)
 {



   double __min_bkts
     = std::max<std::size_t>(__n_elt + __n_ins, _M_next_resize ? 0 : 11)
       / (double)_M_max_load_factor;
   if (__min_bkts >= __n_bkt)
     return { true,
       _M_next_bkt(std::max<std::size_t>(__builtin_floor(__min_bkts) + 1,
      __n_bkt * _S_growth_factor)) };

   _M_next_resize
     = __builtin_floor(__n_bkt * (double)_M_max_load_factor);
   return { false, 0 };
 }
      else
 return { false, 0 };
    }

    typedef std::size_t _State;

    _State
    _M_state() const noexcept
    { return _M_next_resize; }

    void
    _M_reset() noexcept
    { _M_next_resize = 0; }

    void
    _M_reset(_State __state) noexcept
    { _M_next_resize = __state; }

    static const std::size_t _S_growth_factor = 2;

    float _M_max_load_factor;
    std::size_t _M_next_resize;
  };
# 638 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 3
  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits,
    bool _Unique_keys = _Traits::__unique_keys::value>
    struct _Map_base { };


  template<typename _Key, typename _Pair, typename _Alloc, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Map_base<_Key, _Pair, _Alloc, _Select1st, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, false>
    {
      using mapped_type = typename std::tuple_element<1, _Pair>::type;
    };


  template<typename _Key, typename _Pair, typename _Alloc, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Map_base<_Key, _Pair, _Alloc, _Select1st, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, true>
    {
    private:
      using __hashtable_base = _Hashtable_base<_Key, _Pair, _Select1st, _Equal,
            _Hash, _RangeHash, _Unused,
            _Traits>;

      using __hashtable = _Hashtable<_Key, _Pair, _Alloc, _Select1st, _Equal,
         _Hash, _RangeHash,
         _Unused, _RehashPolicy, _Traits>;

      using __hash_code = typename __hashtable_base::__hash_code;

    public:
      using key_type = typename __hashtable_base::key_type;
      using mapped_type = typename std::tuple_element<1, _Pair>::type;

      mapped_type&
      operator[](const key_type& __k);

      mapped_type&
      operator[](key_type&& __k);



      mapped_type&
      at(const key_type& __k);

      const mapped_type&
      at(const key_type& __k) const;
    };

  template<typename _Key, typename _Pair, typename _Alloc, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Map_base<_Key, _Pair, _Alloc, _Select1st, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, true>::
    operator[](const key_type& __k)
    -> mapped_type&
    {
      __hashtable* __h = static_cast<__hashtable*>(this);
      __hash_code __code = __h->_M_hash_code(__k);
      std::size_t __bkt = __h->_M_bucket_index(__code);
      if (auto __node = __h->_M_find_node(__bkt, __k, __code))
 return __node->_M_v().second;

      typename __hashtable::_Scoped_node __node {
 __h,
 std::piecewise_construct,
 std::tuple<const key_type&>(__k),
 std::tuple<>()
      };
      auto __pos
 = __h->_M_insert_unique_node(__bkt, __code, __node._M_node);
      __node._M_node = nullptr;
      return __pos->second;
    }

  template<typename _Key, typename _Pair, typename _Alloc, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Map_base<_Key, _Pair, _Alloc, _Select1st, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, true>::
    operator[](key_type&& __k)
    -> mapped_type&
    {
      __hashtable* __h = static_cast<__hashtable*>(this);
      __hash_code __code = __h->_M_hash_code(__k);
      std::size_t __bkt = __h->_M_bucket_index(__code);
      if (auto __node = __h->_M_find_node(__bkt, __k, __code))
 return __node->_M_v().second;

      typename __hashtable::_Scoped_node __node {
 __h,
 std::piecewise_construct,
 std::forward_as_tuple(std::move(__k)),
 std::tuple<>()
      };
      auto __pos
 = __h->_M_insert_unique_node(__bkt, __code, __node._M_node);
      __node._M_node = nullptr;
      return __pos->second;
    }

  template<typename _Key, typename _Pair, typename _Alloc, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Map_base<_Key, _Pair, _Alloc, _Select1st, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, true>::
    at(const key_type& __k)
    -> mapped_type&
    {
      __hashtable* __h = static_cast<__hashtable*>(this);
      auto __ite = __h->find(__k);

      if (!__ite._M_cur)
 __throw_out_of_range(("_Map_base::at"));
      return __ite->second;
    }

  template<typename _Key, typename _Pair, typename _Alloc, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Map_base<_Key, _Pair, _Alloc, _Select1st, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, true>::
    at(const key_type& __k) const
    -> const mapped_type&
    {
      const __hashtable* __h = static_cast<const __hashtable*>(this);
      auto __ite = __h->find(__k);

      if (!__ite._M_cur)
 __throw_out_of_range(("_Map_base::at"));
      return __ite->second;
    }






  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Insert_base
    {
    protected:
      using __hashtable_base = _Hashtable_base<_Key, _Value, _ExtractKey,
            _Equal, _Hash, _RangeHash,
            _Unused, _Traits>;

      using __hashtable = _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
         _Hash, _RangeHash,
         _Unused, _RehashPolicy, _Traits>;

      using __hash_cached = typename _Traits::__hash_cached;
      using __constant_iterators = typename _Traits::__constant_iterators;

      using __hashtable_alloc = _Hashtable_alloc<
 __alloc_rebind<_Alloc, _Hash_node<_Value,
       __hash_cached::value>>>;

      using value_type = typename __hashtable_base::value_type;
      using size_type = typename __hashtable_base::size_type;

      using __unique_keys = typename _Traits::__unique_keys;
      using __node_alloc_type = typename __hashtable_alloc::__node_alloc_type;
      using __node_gen_type = _AllocNode<__node_alloc_type>;

      __hashtable&
      _M_conjure_hashtable()
      { return *(static_cast<__hashtable*>(this)); }

      template<typename _InputIterator, typename _NodeGetter>
 void
 _M_insert_range(_InputIterator __first, _InputIterator __last,
   const _NodeGetter&, true_type __uks);

      template<typename _InputIterator, typename _NodeGetter>
 void
 _M_insert_range(_InputIterator __first, _InputIterator __last,
   const _NodeGetter&, false_type __uks);

    public:
      using iterator = _Node_iterator<_Value, __constant_iterators::value,
          __hash_cached::value>;

      using const_iterator = _Node_const_iterator<_Value, __constant_iterators::value,
        __hash_cached::value>;

      using __ireturn_type = typename std::conditional<__unique_keys::value,
           std::pair<iterator, bool>,
           iterator>::type;

      __ireturn_type
      insert(const value_type& __v)
      {
 __hashtable& __h = _M_conjure_hashtable();
 __node_gen_type __node_gen(__h);
 return __h._M_insert(__v, __node_gen, __unique_keys{});
      }

      iterator
      insert(const_iterator __hint, const value_type& __v)
      {
 __hashtable& __h = _M_conjure_hashtable();
 __node_gen_type __node_gen(__h);
 return __h._M_insert(__hint, __v, __node_gen, __unique_keys{});
      }

      template<typename _KType, typename... _Args>
 std::pair<iterator, bool>
 try_emplace(const_iterator, _KType&& __k, _Args&&... __args)
 {
   __hashtable& __h = _M_conjure_hashtable();
   auto __code = __h._M_hash_code(__k);
   std::size_t __bkt = __h._M_bucket_index(__code);
   if (auto __node = __h._M_find_node(__bkt, __k, __code))
     return { iterator(__node), false };

   typename __hashtable::_Scoped_node __node {
     &__h,
     std::piecewise_construct,
     std::forward_as_tuple(std::forward<_KType>(__k)),
     std::forward_as_tuple(std::forward<_Args>(__args)...)
     };
   auto __it
     = __h._M_insert_unique_node(__bkt, __code, __node._M_node);
   __node._M_node = nullptr;
   return { __it, true };
 }

      void
      insert(initializer_list<value_type> __l)
      { this->insert(__l.begin(), __l.end()); }

      template<typename _InputIterator>
 void
 insert(_InputIterator __first, _InputIterator __last)
 {
   __hashtable& __h = _M_conjure_hashtable();
   __node_gen_type __node_gen(__h);
   return _M_insert_range(__first, __last, __node_gen, __unique_keys{});
 }
    };

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _InputIterator, typename _NodeGetter>
      void
      _Insert_base<_Key, _Value, _Alloc, _ExtractKey, _Equal,
     _Hash, _RangeHash, _Unused,
     _RehashPolicy, _Traits>::
      _M_insert_range(_InputIterator __first, _InputIterator __last,
        const _NodeGetter& __node_gen, true_type __uks)
      {
 __hashtable& __h = _M_conjure_hashtable();
 for (; __first != __last; ++__first)
   __h._M_insert(*__first, __node_gen, __uks);
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _InputIterator, typename _NodeGetter>
      void
      _Insert_base<_Key, _Value, _Alloc, _ExtractKey, _Equal,
     _Hash, _RangeHash, _Unused,
     _RehashPolicy, _Traits>::
      _M_insert_range(_InputIterator __first, _InputIterator __last,
        const _NodeGetter& __node_gen, false_type __uks)
      {
 using __rehash_type = typename __hashtable::__rehash_type;
 using __rehash_state = typename __hashtable::__rehash_state;
 using pair_type = std::pair<bool, std::size_t>;

 size_type __n_elt = __detail::__distance_fw(__first, __last);
 if (__n_elt == 0)
   return;

 __hashtable& __h = _M_conjure_hashtable();
 __rehash_type& __rehash = __h._M_rehash_policy;
 const __rehash_state& __saved_state = __rehash._M_state();
 pair_type __do_rehash = __rehash._M_need_rehash(__h._M_bucket_count,
       __h._M_element_count,
       __n_elt);

 if (__do_rehash.first)
   __h._M_rehash(__do_rehash.second, __saved_state);

 for (; __first != __last; ++__first)
   __h._M_insert(*__first, __node_gen, __uks);
      }







  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits,
    bool _Constant_iterators = _Traits::__constant_iterators::value>
    struct _Insert;


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Insert<_Key, _Value, _Alloc, _ExtractKey, _Equal,
     _Hash, _RangeHash, _Unused,
     _RehashPolicy, _Traits, true>
    : public _Insert_base<_Key, _Value, _Alloc, _ExtractKey, _Equal,
     _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>
    {
      using __base_type = _Insert_base<_Key, _Value, _Alloc, _ExtractKey,
           _Equal, _Hash, _RangeHash, _Unused,
           _RehashPolicy, _Traits>;

      using value_type = typename __base_type::value_type;
      using iterator = typename __base_type::iterator;
      using const_iterator = typename __base_type::const_iterator;
      using __ireturn_type = typename __base_type::__ireturn_type;

      using __unique_keys = typename __base_type::__unique_keys;
      using __hashtable = typename __base_type::__hashtable;
      using __node_gen_type = typename __base_type::__node_gen_type;

      using __base_type::insert;

      __ireturn_type
      insert(value_type&& __v)
      {
 __hashtable& __h = this->_M_conjure_hashtable();
 __node_gen_type __node_gen(__h);
 return __h._M_insert(std::move(__v), __node_gen, __unique_keys{});
      }

      iterator
      insert(const_iterator __hint, value_type&& __v)
      {
 __hashtable& __h = this->_M_conjure_hashtable();
 __node_gen_type __node_gen(__h);
 return __h._M_insert(__hint, std::move(__v), __node_gen,
        __unique_keys{});
      }
    };


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Insert<_Key, _Value, _Alloc, _ExtractKey, _Equal,
     _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, false>
    : public _Insert_base<_Key, _Value, _Alloc, _ExtractKey, _Equal,
     _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>
    {
      using __base_type = _Insert_base<_Key, _Value, _Alloc, _ExtractKey,
           _Equal, _Hash, _RangeHash, _Unused,
           _RehashPolicy, _Traits>;
      using value_type = typename __base_type::value_type;
      using iterator = typename __base_type::iterator;
      using const_iterator = typename __base_type::const_iterator;

      using __unique_keys = typename __base_type::__unique_keys;
      using __hashtable = typename __base_type::__hashtable;
      using __ireturn_type = typename __base_type::__ireturn_type;

      using __base_type::insert;

      template<typename _Pair>
 using __is_cons = std::is_constructible<value_type, _Pair&&>;

      template<typename _Pair>
 using _IFcons = std::enable_if<__is_cons<_Pair>::value>;

      template<typename _Pair>
 using _IFconsp = typename _IFcons<_Pair>::type;

      template<typename _Pair, typename = _IFconsp<_Pair>>
 __ireturn_type
 insert(_Pair&& __v)
 {
   __hashtable& __h = this->_M_conjure_hashtable();
   return __h._M_emplace(__unique_keys{}, std::forward<_Pair>(__v));
 }

      template<typename _Pair, typename = _IFconsp<_Pair>>
 iterator
 insert(const_iterator __hint, _Pair&& __v)
 {
   __hashtable& __h = this->_M_conjure_hashtable();
   return __h._M_emplace(__hint, __unique_keys{},
    std::forward<_Pair>(__v));
 }
   };

  template<typename _Policy>
    using __has_load_factor = typename _Policy::__has_load_factor;







  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits,
    typename =
      __detected_or_t<false_type, __has_load_factor, _RehashPolicy>>
    struct _Rehash_base;


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Rehash_base<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits,
   false_type >
    {
    };


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Rehash_base<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits,
   true_type >
    {
      using __hashtable = _Hashtable<_Key, _Value, _Alloc, _ExtractKey,
         _Equal, _Hash, _RangeHash, _Unused,
         _RehashPolicy, _Traits>;

      float
      max_load_factor() const noexcept
      {
 const __hashtable* __this = static_cast<const __hashtable*>(this);
 return __this->__rehash_policy().max_load_factor();
      }

      void
      max_load_factor(float __z)
      {
 __hashtable* __this = static_cast<__hashtable*>(this);
 __this->__rehash_policy(_RehashPolicy(__z));
      }

      void
      reserve(std::size_t __n)
      {
 __hashtable* __this = static_cast<__hashtable*>(this);
 __this->rehash(__this->__rehash_policy()._M_bkt_for_elements(__n));
      }
    };







  template<int _Nm, typename _Tp,
    bool __use_ebo = !__is_final(_Tp) && __is_empty(_Tp)>
    struct _Hashtable_ebo_helper;


  template<int _Nm, typename _Tp>
    struct _Hashtable_ebo_helper<_Nm, _Tp, true>
    : private _Tp
    {
      _Hashtable_ebo_helper() noexcept(noexcept(_Tp())) : _Tp() { }

      template<typename _OtherTp>
 _Hashtable_ebo_helper(_OtherTp&& __tp)
 : _Tp(std::forward<_OtherTp>(__tp))
 { }

      const _Tp& _M_cget() const { return static_cast<const _Tp&>(*this); }
      _Tp& _M_get() { return static_cast<_Tp&>(*this); }
    };


  template<int _Nm, typename _Tp>
    struct _Hashtable_ebo_helper<_Nm, _Tp, false>
    {
      _Hashtable_ebo_helper() = default;

      template<typename _OtherTp>
 _Hashtable_ebo_helper(_OtherTp&& __tp)
 : _M_tp(std::forward<_OtherTp>(__tp))
 { }

      const _Tp& _M_cget() const { return _M_tp; }
      _Tp& _M_get() { return _M_tp; }

    private:
      _Tp _M_tp{};
    };







  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Hash, typename _RangeHash, typename _Unused,
    bool __cache_hash_code>
    struct _Local_iterator_base;
# 1185 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 3
  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Hash, typename _RangeHash, typename _Unused,
    bool __cache_hash_code>
    struct _Hash_code_base
    : private _Hashtable_ebo_helper<1, _Hash>
    {
    private:
      using __ebo_hash = _Hashtable_ebo_helper<1, _Hash>;


      friend struct _Local_iterator_base<_Key, _Value, _ExtractKey,
      _Hash, _RangeHash, _Unused, false>;

    public:
      typedef _Hash hasher;

      hasher
      hash_function() const
      { return _M_hash(); }

    protected:
      typedef std::size_t __hash_code;



      _Hash_code_base() = default;

      _Hash_code_base(const _Hash& __hash) : __ebo_hash(__hash) { }

      __hash_code
      _M_hash_code(const _Key& __k) const
      {
 static_assert(__is_invocable<const _Hash&, const _Key&>{},
     "hash function must be invocable with an argument of key type");
 return _M_hash()(__k);
      }

      template<typename _Kt>
 __hash_code
 _M_hash_code_tr(const _Kt& __k) const
 {
   static_assert(__is_invocable<const _Hash&, const _Kt&>{},
     "hash function must be invocable with an argument of key type");
   return _M_hash()(__k);
 }

      std::size_t
      _M_bucket_index(__hash_code __c, std::size_t __bkt_count) const
      { return _RangeHash{}(__c, __bkt_count); }

      std::size_t
      _M_bucket_index(const _Hash_node_value<_Value, false>& __n,
        std::size_t __bkt_count) const
 noexcept( noexcept(declval<const _Hash&>()(declval<const _Key&>()))
    && noexcept(declval<const _RangeHash&>()((__hash_code)0,
          (std::size_t)0)) )
      {
 return _RangeHash{}(_M_hash_code(_ExtractKey{}(__n._M_v())),
       __bkt_count);
      }

      std::size_t
      _M_bucket_index(const _Hash_node_value<_Value, true>& __n,
        std::size_t __bkt_count) const
 noexcept( noexcept(declval<const _RangeHash&>()((__hash_code)0,
       (std::size_t)0)) )
      { return _RangeHash{}(__n._M_hash_code, __bkt_count); }

      void
      _M_store_code(_Hash_node_code_cache<false>&, __hash_code) const
      { }

      void
      _M_copy_code(_Hash_node_code_cache<false>&,
     const _Hash_node_code_cache<false>&) const
      { }

      void
      _M_store_code(_Hash_node_code_cache<true>& __n, __hash_code __c) const
      { __n._M_hash_code = __c; }

      void
      _M_copy_code(_Hash_node_code_cache<true>& __to,
     const _Hash_node_code_cache<true>& __from) const
      { __to._M_hash_code = __from._M_hash_code; }

      void
      _M_swap(_Hash_code_base& __x)
      { std::swap(__ebo_hash::_M_get(), __x.__ebo_hash::_M_get()); }

      const _Hash&
      _M_hash() const { return __ebo_hash::_M_cget(); }
    };


  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Hash, typename _RangeHash, typename _Unused>
    struct _Local_iterator_base<_Key, _Value, _ExtractKey,
    _Hash, _RangeHash, _Unused, true>
    : public _Node_iterator_base<_Value, true>
    {
    protected:
      using __base_node_iter = _Node_iterator_base<_Value, true>;
      using __hash_code_base = _Hash_code_base<_Key, _Value, _ExtractKey,
           _Hash, _RangeHash, _Unused, true>;

      _Local_iterator_base() = default;
      _Local_iterator_base(const __hash_code_base&,
      _Hash_node<_Value, true>* __p,
      std::size_t __bkt, std::size_t __bkt_count)
      : __base_node_iter(__p), _M_bucket(__bkt), _M_bucket_count(__bkt_count)
      { }

      void
      _M_incr()
      {
 __base_node_iter::_M_incr();
 if (this->_M_cur)
   {
     std::size_t __bkt
       = _RangeHash{}(this->_M_cur->_M_hash_code, _M_bucket_count);
     if (__bkt != _M_bucket)
       this->_M_cur = nullptr;
   }
      }

      std::size_t _M_bucket;
      std::size_t _M_bucket_count;

    public:
      std::size_t
      _M_get_bucket() const { return _M_bucket; }
    };





  template<typename _Tp, bool _IsEmpty = std::is_empty<_Tp>::value>
    struct _Hash_code_storage
    {
      __gnu_cxx::__aligned_buffer<_Tp> _M_storage;

      _Tp*
      _M_h() { return _M_storage._M_ptr(); }

      const _Tp*
      _M_h() const { return _M_storage._M_ptr(); }
    };


  template<typename _Tp>
    struct _Hash_code_storage<_Tp, true>
    {
      static_assert( std::is_empty<_Tp>::value, "Type must be empty" );



      _Tp*
      _M_h() { return reinterpret_cast<_Tp*>(this); }

      const _Tp*
      _M_h() const { return reinterpret_cast<const _Tp*>(this); }
    };

  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Hash, typename _RangeHash, typename _Unused>
    using __hash_code_for_local_iter
      = _Hash_code_storage<_Hash_code_base<_Key, _Value, _ExtractKey,
        _Hash, _RangeHash, _Unused, false>>;


  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Hash, typename _RangeHash, typename _Unused>
    struct _Local_iterator_base<_Key, _Value, _ExtractKey,
    _Hash, _RangeHash, _Unused, false>
    : __hash_code_for_local_iter<_Key, _Value, _ExtractKey, _Hash, _RangeHash,
     _Unused>
    , _Node_iterator_base<_Value, false>
    {
    protected:
      using __hash_code_base = _Hash_code_base<_Key, _Value, _ExtractKey,
          _Hash, _RangeHash, _Unused, false>;
      using __node_iter_base = _Node_iterator_base<_Value, false>;

      _Local_iterator_base() : _M_bucket_count(-1) { }

      _Local_iterator_base(const __hash_code_base& __base,
      _Hash_node<_Value, false>* __p,
      std::size_t __bkt, std::size_t __bkt_count)
      : __node_iter_base(__p), _M_bucket(__bkt), _M_bucket_count(__bkt_count)
      { _M_init(__base); }

      ~_Local_iterator_base()
      {
 if (_M_bucket_count != size_t(-1))
   _M_destroy();
      }

      _Local_iterator_base(const _Local_iterator_base& __iter)
      : __node_iter_base(__iter._M_cur), _M_bucket(__iter._M_bucket)
      , _M_bucket_count(__iter._M_bucket_count)
      {
 if (_M_bucket_count != size_t(-1))
   _M_init(*__iter._M_h());
      }

      _Local_iterator_base&
      operator=(const _Local_iterator_base& __iter)
      {
 if (_M_bucket_count != -1)
   _M_destroy();
 this->_M_cur = __iter._M_cur;
 _M_bucket = __iter._M_bucket;
 _M_bucket_count = __iter._M_bucket_count;
 if (_M_bucket_count != -1)
   _M_init(*__iter._M_h());
 return *this;
      }

      void
      _M_incr()
      {
 __node_iter_base::_M_incr();
 if (this->_M_cur)
   {
     std::size_t __bkt = this->_M_h()->_M_bucket_index(*this->_M_cur,
             _M_bucket_count);
     if (__bkt != _M_bucket)
       this->_M_cur = nullptr;
   }
      }

      std::size_t _M_bucket;
      std::size_t _M_bucket_count;

      void
      _M_init(const __hash_code_base& __base)
      { ::new(this->_M_h()) __hash_code_base(__base); }

      void
      _M_destroy() { this->_M_h()->~__hash_code_base(); }

    public:
      std::size_t
      _M_get_bucket() const { return _M_bucket; }
    };


  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Hash, typename _RangeHash, typename _Unused,
    bool __constant_iterators, bool __cache>
    struct _Local_iterator
    : public _Local_iterator_base<_Key, _Value, _ExtractKey,
      _Hash, _RangeHash, _Unused, __cache>
    {
    private:
      using __base_type = _Local_iterator_base<_Key, _Value, _ExtractKey,
        _Hash, _RangeHash, _Unused, __cache>;
      using __hash_code_base = typename __base_type::__hash_code_base;

    public:
      typedef _Value value_type;
      typedef typename std::conditional<__constant_iterators,
     const value_type*, value_type*>::type
       pointer;
      typedef typename std::conditional<__constant_iterators,
     const value_type&, value_type&>::type
       reference;
      typedef std::ptrdiff_t difference_type;
      typedef std::forward_iterator_tag iterator_category;

      _Local_iterator() = default;

      _Local_iterator(const __hash_code_base& __base,
        _Hash_node<_Value, __cache>* __n,
        std::size_t __bkt, std::size_t __bkt_count)
      : __base_type(__base, __n, __bkt, __bkt_count)
      { }

      reference
      operator*() const
      { return this->_M_cur->_M_v(); }

      pointer
      operator->() const
      { return this->_M_cur->_M_valptr(); }

      _Local_iterator&
      operator++()
      {
 this->_M_incr();
 return *this;
      }

      _Local_iterator
      operator++(int)
      {
 _Local_iterator __tmp(*this);
 this->_M_incr();
 return __tmp;
      }
    };


  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Hash, typename _RangeHash, typename _Unused,
    bool __constant_iterators, bool __cache>
    struct _Local_const_iterator
    : public _Local_iterator_base<_Key, _Value, _ExtractKey,
      _Hash, _RangeHash, _Unused, __cache>
    {
    private:
      using __base_type = _Local_iterator_base<_Key, _Value, _ExtractKey,
        _Hash, _RangeHash, _Unused, __cache>;
      using __hash_code_base = typename __base_type::__hash_code_base;

    public:
      typedef _Value value_type;
      typedef const value_type* pointer;
      typedef const value_type& reference;
      typedef std::ptrdiff_t difference_type;
      typedef std::forward_iterator_tag iterator_category;

      _Local_const_iterator() = default;

      _Local_const_iterator(const __hash_code_base& __base,
       _Hash_node<_Value, __cache>* __n,
       std::size_t __bkt, std::size_t __bkt_count)
      : __base_type(__base, __n, __bkt, __bkt_count)
      { }

      _Local_const_iterator(const _Local_iterator<_Key, _Value, _ExtractKey,
        _Hash, _RangeHash, _Unused,
        __constant_iterators,
        __cache>& __x)
      : __base_type(__x)
      { }

      reference
      operator*() const
      { return this->_M_cur->_M_v(); }

      pointer
      operator->() const
      { return this->_M_cur->_M_valptr(); }

      _Local_const_iterator&
      operator++()
      {
 this->_M_incr();
 return *this;
      }

      _Local_const_iterator
      operator++(int)
      {
 _Local_const_iterator __tmp(*this);
 this->_M_incr();
 return __tmp;
      }
    };
# 1558 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 3
  template<typename _Key, typename _Value, typename _ExtractKey,
    typename _Equal, typename _Hash, typename _RangeHash,
    typename _Unused, typename _Traits>
    struct _Hashtable_base
    : public _Hash_code_base<_Key, _Value, _ExtractKey, _Hash, _RangeHash,
        _Unused, _Traits::__hash_cached::value>,
      private _Hashtable_ebo_helper<0, _Equal>
    {
    public:
      typedef _Key key_type;
      typedef _Value value_type;
      typedef _Equal key_equal;
      typedef std::size_t size_type;
      typedef std::ptrdiff_t difference_type;

      using __traits_type = _Traits;
      using __hash_cached = typename __traits_type::__hash_cached;

      using __hash_code_base = _Hash_code_base<_Key, _Value, _ExtractKey,
            _Hash, _RangeHash, _Unused,
            __hash_cached::value>;

      using __hash_code = typename __hash_code_base::__hash_code;

    private:
      using _EqualEBO = _Hashtable_ebo_helper<0, _Equal>;

      static bool
      _S_equals(__hash_code, const _Hash_node_code_cache<false>&)
      { return true; }

      static bool
      _S_node_equals(const _Hash_node_code_cache<false>&,
       const _Hash_node_code_cache<false>&)
      { return true; }

      static bool
      _S_equals(__hash_code __c, const _Hash_node_code_cache<true>& __n)
      { return __c == __n._M_hash_code; }

      static bool
      _S_node_equals(const _Hash_node_code_cache<true>& __lhn,
       const _Hash_node_code_cache<true>& __rhn)
      { return __lhn._M_hash_code == __rhn._M_hash_code; }

    protected:
      _Hashtable_base() = default;

      _Hashtable_base(const _Hash& __hash, const _Equal& __eq)
      : __hash_code_base(__hash), _EqualEBO(__eq)
      { }

      bool
      _M_equals(const _Key& __k, __hash_code __c,
  const _Hash_node_value<_Value, __hash_cached::value>& __n) const
      {
 static_assert(__is_invocable<const _Equal&, const _Key&, const _Key&>{},
   "key equality predicate must be invocable with two arguments of "
   "key type");
 return _S_equals(__c, __n) && _M_eq()(__k, _ExtractKey{}(__n._M_v()));
      }

      template<typename _Kt>
 bool
 _M_equals_tr(const _Kt& __k, __hash_code __c,
       const _Hash_node_value<_Value,
         __hash_cached::value>& __n) const
 {
   static_assert(
     __is_invocable<const _Equal&, const _Kt&, const _Key&>{},
     "key equality predicate must be invocable with two arguments of "
     "key type");
   return _S_equals(__c, __n) && _M_eq()(__k, _ExtractKey{}(__n._M_v()));
 }

      bool
      _M_node_equals(
 const _Hash_node_value<_Value, __hash_cached::value>& __lhn,
 const _Hash_node_value<_Value, __hash_cached::value>& __rhn) const
      {
 return _S_node_equals(__lhn, __rhn)
   && _M_eq()(_ExtractKey{}(__lhn._M_v()), _ExtractKey{}(__rhn._M_v()));
      }

      void
      _M_swap(_Hashtable_base& __x)
      {
 __hash_code_base::_M_swap(__x);
 std::swap(_EqualEBO::_M_get(), __x._EqualEBO::_M_get());
      }

      const _Equal&
      _M_eq() const { return _EqualEBO::_M_cget(); }
    };
# 1661 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable_policy.h" 3
  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits,
    bool _Unique_keys = _Traits::__unique_keys::value>
    struct _Equality;


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Equality<_Key, _Value, _Alloc, _ExtractKey, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, true>
    {
      using __hashtable = _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
         _Hash, _RangeHash, _Unused,
         _RehashPolicy, _Traits>;

      bool
      _M_equal(const __hashtable&) const;
    };

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    bool
    _Equality<_Key, _Value, _Alloc, _ExtractKey, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, true>::
    _M_equal(const __hashtable& __other) const
    {
      using __node_type = typename __hashtable::__node_type;
      const __hashtable* __this = static_cast<const __hashtable*>(this);
      if (__this->size() != __other.size())
 return false;

      for (auto __itx = __this->begin(); __itx != __this->end(); ++__itx)
 {
   std::size_t __ybkt = __other._M_bucket_index(*__itx._M_cur);
   auto __prev_n = __other._M_buckets[__ybkt];
   if (!__prev_n)
     return false;

   for (__node_type* __n = static_cast<__node_type*>(__prev_n->_M_nxt);;
        __n = __n->_M_next())
     {
       if (__n->_M_v() == *__itx)
  break;

       if (!__n->_M_nxt
    || __other._M_bucket_index(*__n->_M_next()) != __ybkt)
  return false;
     }
 }

      return true;
    }


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    struct _Equality<_Key, _Value, _Alloc, _ExtractKey, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, false>
    {
      using __hashtable = _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
         _Hash, _RangeHash, _Unused,
         _RehashPolicy, _Traits>;

      bool
      _M_equal(const __hashtable&) const;
    };

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    bool
    _Equality<_Key, _Value, _Alloc, _ExtractKey, _Equal,
       _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits, false>::
    _M_equal(const __hashtable& __other) const
    {
      using __node_type = typename __hashtable::__node_type;
      const __hashtable* __this = static_cast<const __hashtable*>(this);
      if (__this->size() != __other.size())
 return false;

      for (auto __itx = __this->begin(); __itx != __this->end();)
 {
   std::size_t __x_count = 1;
   auto __itx_end = __itx;
   for (++__itx_end; __itx_end != __this->end()
   && __this->key_eq()(_ExtractKey{}(*__itx),
         _ExtractKey{}(*__itx_end));
        ++__itx_end)
     ++__x_count;

   std::size_t __ybkt = __other._M_bucket_index(*__itx._M_cur);
   auto __y_prev_n = __other._M_buckets[__ybkt];
   if (!__y_prev_n)
     return false;

   __node_type* __y_n = static_cast<__node_type*>(__y_prev_n->_M_nxt);
   for (;;)
     {
       if (__this->key_eq()(_ExtractKey{}(__y_n->_M_v()),
       _ExtractKey{}(*__itx)))
  break;

       auto __y_ref_n = __y_n;
       for (__y_n = __y_n->_M_next(); __y_n; __y_n = __y_n->_M_next())
  if (!__other._M_node_equals(*__y_ref_n, *__y_n))
    break;

       if (!__y_n || __other._M_bucket_index(*__y_n) != __ybkt)
  return false;
     }

   typename __hashtable::const_iterator __ity(__y_n);
   for (auto __ity_end = __ity; __ity_end != __other.end(); ++__ity_end)
     if (--__x_count == 0)
       break;

   if (__x_count != 0)
     return false;

   if (!std::is_permutation(__itx, __itx_end, __ity))
     return false;

   __itx = __itx_end;
 }
      return true;
    }





  template<typename _NodeAlloc>
    struct _Hashtable_alloc : private _Hashtable_ebo_helper<0, _NodeAlloc>
    {
    private:
      using __ebo_node_alloc = _Hashtable_ebo_helper<0, _NodeAlloc>;
    public:
      using __node_type = typename _NodeAlloc::value_type;
      using __node_alloc_type = _NodeAlloc;

      using __node_alloc_traits = __gnu_cxx::__alloc_traits<__node_alloc_type>;

      using __value_alloc_traits = typename __node_alloc_traits::template
 rebind_traits<typename __node_type::value_type>;

      using __node_ptr = __node_type*;
      using __node_base = _Hash_node_base;
      using __node_base_ptr = __node_base*;
      using __buckets_alloc_type =
 __alloc_rebind<__node_alloc_type, __node_base_ptr>;
      using __buckets_alloc_traits = std::allocator_traits<__buckets_alloc_type>;
      using __buckets_ptr = __node_base_ptr*;

      _Hashtable_alloc() = default;
      _Hashtable_alloc(const _Hashtable_alloc&) = default;
      _Hashtable_alloc(_Hashtable_alloc&&) = default;

      template<typename _Alloc>
 _Hashtable_alloc(_Alloc&& __a)
 : __ebo_node_alloc(std::forward<_Alloc>(__a))
 { }

      __node_alloc_type&
      _M_node_allocator()
      { return __ebo_node_alloc::_M_get(); }

      const __node_alloc_type&
      _M_node_allocator() const
      { return __ebo_node_alloc::_M_cget(); }


      template<typename... _Args>
 __node_ptr
 _M_allocate_node(_Args&&... __args);


      void
      _M_deallocate_node(__node_ptr __n);


      void
      _M_deallocate_node_ptr(__node_ptr __n);



      void
      _M_deallocate_nodes(__node_ptr __n);

      __buckets_ptr
      _M_allocate_buckets(std::size_t __bkt_count);

      void
      _M_deallocate_buckets(__buckets_ptr, std::size_t __bkt_count);
    };



  template<typename _NodeAlloc>
    template<typename... _Args>
      auto
      _Hashtable_alloc<_NodeAlloc>::_M_allocate_node(_Args&&... __args)
      -> __node_ptr
      {
 auto __nptr = __node_alloc_traits::allocate(_M_node_allocator(), 1);
 __node_ptr __n = std::__to_address(__nptr);
 try
   {
     ::new ((void*)__n) __node_type;
     __node_alloc_traits::construct(_M_node_allocator(),
        __n->_M_valptr(),
        std::forward<_Args>(__args)...);
     return __n;
   }
 catch(...)
   {
     __node_alloc_traits::deallocate(_M_node_allocator(), __nptr, 1);
     throw;
   }
      }

  template<typename _NodeAlloc>
    void
    _Hashtable_alloc<_NodeAlloc>::_M_deallocate_node(__node_ptr __n)
    {
      __node_alloc_traits::destroy(_M_node_allocator(), __n->_M_valptr());
      _M_deallocate_node_ptr(__n);
    }

  template<typename _NodeAlloc>
    void
    _Hashtable_alloc<_NodeAlloc>::_M_deallocate_node_ptr(__node_ptr __n)
    {
      typedef typename __node_alloc_traits::pointer _Ptr;
      auto __ptr = std::pointer_traits<_Ptr>::pointer_to(*__n);
      __n->~__node_type();
      __node_alloc_traits::deallocate(_M_node_allocator(), __ptr, 1);
    }

  template<typename _NodeAlloc>
    void
    _Hashtable_alloc<_NodeAlloc>::_M_deallocate_nodes(__node_ptr __n)
    {
      while (__n)
 {
   __node_ptr __tmp = __n;
   __n = __n->_M_next();
   _M_deallocate_node(__tmp);
 }
    }

  template<typename _NodeAlloc>
    auto
    _Hashtable_alloc<_NodeAlloc>::_M_allocate_buckets(std::size_t __bkt_count)
    -> __buckets_ptr
    {
      __buckets_alloc_type __alloc(_M_node_allocator());

      auto __ptr = __buckets_alloc_traits::allocate(__alloc, __bkt_count);
      __buckets_ptr __p = std::__to_address(__ptr);
      __builtin_memset(__p, 0, __bkt_count * sizeof(__node_base_ptr));
      return __p;
    }

  template<typename _NodeAlloc>
    void
    _Hashtable_alloc<_NodeAlloc>::
    _M_deallocate_buckets(__buckets_ptr __bkts,
     std::size_t __bkt_count)
    {
      typedef typename __buckets_alloc_traits::pointer _Ptr;
      auto __ptr = std::pointer_traits<_Ptr>::pointer_to(*__bkts);
      __buckets_alloc_type __alloc(_M_node_allocator());
      __buckets_alloc_traits::deallocate(__alloc, __ptr, __bkt_count);
    }


}


}
# 36 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/enable_special_members.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/enable_special_members.h" 3



namespace std __attribute__ ((__visibility__ ("default")))
{



  struct _Enable_default_constructor_tag
  {
    explicit constexpr _Enable_default_constructor_tag() = default;
  };






template<bool _Switch, typename _Tag = void>
  struct _Enable_default_constructor
  {
    constexpr _Enable_default_constructor() noexcept = default;
    constexpr _Enable_default_constructor(_Enable_default_constructor const&)
      noexcept = default;
    constexpr _Enable_default_constructor(_Enable_default_constructor&&)
      noexcept = default;
    _Enable_default_constructor&
    operator=(_Enable_default_constructor const&) noexcept = default;
    _Enable_default_constructor&
    operator=(_Enable_default_constructor&&) noexcept = default;


    constexpr explicit
    _Enable_default_constructor(_Enable_default_constructor_tag) { }
  };







template<bool _Switch, typename _Tag = void>
  struct _Enable_destructor { };






template<bool _Copy, bool _CopyAssignment,
         bool _Move, bool _MoveAssignment,
         typename _Tag = void>
  struct _Enable_copy_move { };
# 96 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/enable_special_members.h" 3
template<bool _Default, bool _Destructor,
         bool _Copy, bool _CopyAssignment,
         bool _Move, bool _MoveAssignment,
         typename _Tag = void>
  struct _Enable_special_members
  : private _Enable_default_constructor<_Default, _Tag>,
    private _Enable_destructor<_Destructor, _Tag>,
    private _Enable_copy_move<_Copy, _CopyAssignment,
                              _Move, _MoveAssignment,
                              _Tag>
  { };



template<typename _Tag>
  struct _Enable_default_constructor<false, _Tag>
  {
    constexpr _Enable_default_constructor() noexcept = delete;
    constexpr _Enable_default_constructor(_Enable_default_constructor const&)
      noexcept = default;
    constexpr _Enable_default_constructor(_Enable_default_constructor&&)
      noexcept = default;
    _Enable_default_constructor&
    operator=(_Enable_default_constructor const&) noexcept = default;
    _Enable_default_constructor&
    operator=(_Enable_default_constructor&&) noexcept = default;


    constexpr explicit
    _Enable_default_constructor(_Enable_default_constructor_tag) { }
  };

template<typename _Tag>
  struct _Enable_destructor<false, _Tag>
  { ~_Enable_destructor() noexcept = delete; };

template<typename _Tag>
  struct _Enable_copy_move<false, true, true, true, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = delete;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = default;
  };

template<typename _Tag>
  struct _Enable_copy_move<true, false, true, true, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = default;
  };

template<typename _Tag>
  struct _Enable_copy_move<false, false, true, true, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = delete;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = default;
  };

template<typename _Tag>
  struct _Enable_copy_move<true, true, false, true, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = default;
  };

template<typename _Tag>
  struct _Enable_copy_move<false, true, false, true, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = delete;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = default;
  };

template<typename _Tag>
  struct _Enable_copy_move<true, false, false, true, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = default;
  };

template<typename _Tag>
  struct _Enable_copy_move<false, false, false, true, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = delete;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = default;
  };

template<typename _Tag>
  struct _Enable_copy_move<true, true, true, false, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = delete;
  };

template<typename _Tag>
  struct _Enable_copy_move<false, true, true, false, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = delete;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = delete;
  };

template<typename _Tag>
  struct _Enable_copy_move<true, false, true, false, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = delete;
  };

template<typename _Tag>
  struct _Enable_copy_move<false, false, true, false, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = delete;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = delete;
  };

template<typename _Tag>
  struct _Enable_copy_move<true, true, false, false, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = delete;
  };

template<typename _Tag>
  struct _Enable_copy_move<false, true, false, false, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = delete;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = default;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = delete;
  };

template<typename _Tag>
  struct _Enable_copy_move<true, false, false, false, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = delete;
  };

template<typename _Tag>
  struct _Enable_copy_move<false, false, false, false, _Tag>
  {
    constexpr _Enable_copy_move() noexcept = default;
    constexpr _Enable_copy_move(_Enable_copy_move const&) noexcept = delete;
    constexpr _Enable_copy_move(_Enable_copy_move&&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move const&) noexcept = delete;
    _Enable_copy_move&
    operator=(_Enable_copy_move&&) noexcept = delete;
  };



}
# 37 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 2 3




namespace std __attribute__ ((__visibility__ ("default")))
{



  template<typename _Tp, typename _Hash>
    using __cache_default
      = __not_<__and_<
         __is_fast_hash<_Hash>,

         __is_nothrow_invocable<const _Hash&, const _Tp&>>>;




  template<typename _Equal, typename _Hash, typename _Allocator>
    using _Hashtable_enable_default_ctor
      = _Enable_default_constructor<__and_<is_default_constructible<_Equal>,
           is_default_constructible<_Hash>,
           is_default_constructible<_Allocator>>{},
        __detail::_Hash_node_base>;
# 176 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 3
  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    class _Hashtable
    : public __detail::_Hashtable_base<_Key, _Value, _ExtractKey, _Equal,
           _Hash, _RangeHash, _Unused, _Traits>,
      public __detail::_Map_base<_Key, _Value, _Alloc, _ExtractKey, _Equal,
     _Hash, _RangeHash, _Unused,
     _RehashPolicy, _Traits>,
      public __detail::_Insert<_Key, _Value, _Alloc, _ExtractKey, _Equal,
          _Hash, _RangeHash, _Unused,
          _RehashPolicy, _Traits>,
      public __detail::_Rehash_base<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused,
        _RehashPolicy, _Traits>,
      public __detail::_Equality<_Key, _Value, _Alloc, _ExtractKey, _Equal,
     _Hash, _RangeHash, _Unused,
     _RehashPolicy, _Traits>,
      private __detail::_Hashtable_alloc<
 __alloc_rebind<_Alloc,
         __detail::_Hash_node<_Value,
         _Traits::__hash_cached::value>>>,
      private _Hashtable_enable_default_ctor<_Equal, _Hash, _Alloc>
    {
      static_assert(is_same<typename remove_cv<_Value>::type, _Value>::value,
   "unordered container must have a non-const, non-volatile value_type");

      static_assert(is_same<typename _Alloc::value_type, _Value>{},
   "unordered container must have the same value_type as its allocator");


      using __traits_type = _Traits;
      using __hash_cached = typename __traits_type::__hash_cached;
      using __constant_iterators = typename __traits_type::__constant_iterators;
      using __node_type = __detail::_Hash_node<_Value, __hash_cached::value>;
      using __node_alloc_type = __alloc_rebind<_Alloc, __node_type>;

      using __hashtable_alloc = __detail::_Hashtable_alloc<__node_alloc_type>;

      using __node_value_type =
 __detail::_Hash_node_value<_Value, __hash_cached::value>;
      using __node_ptr = typename __hashtable_alloc::__node_ptr;
      using __value_alloc_traits =
 typename __hashtable_alloc::__value_alloc_traits;
      using __node_alloc_traits =
 typename __hashtable_alloc::__node_alloc_traits;
      using __node_base = typename __hashtable_alloc::__node_base;
      using __node_base_ptr = typename __hashtable_alloc::__node_base_ptr;
      using __buckets_ptr = typename __hashtable_alloc::__buckets_ptr;

      using __insert_base = __detail::_Insert<_Key, _Value, _Alloc, _ExtractKey,
           _Equal, _Hash,
           _RangeHash, _Unused,
           _RehashPolicy, _Traits>;
      using __enable_default_ctor
 = _Hashtable_enable_default_ctor<_Equal, _Hash, _Alloc>;

    public:
      typedef _Key key_type;
      typedef _Value value_type;
      typedef _Alloc allocator_type;
      typedef _Equal key_equal;



      typedef typename __value_alloc_traits::pointer pointer;
      typedef typename __value_alloc_traits::const_pointer const_pointer;
      typedef value_type& reference;
      typedef const value_type& const_reference;

      using iterator = typename __insert_base::iterator;

      using const_iterator = typename __insert_base::const_iterator;

      using local_iterator = __detail::_Local_iterator<key_type, _Value,
   _ExtractKey, _Hash, _RangeHash, _Unused,
          __constant_iterators::value,
          __hash_cached::value>;

      using const_local_iterator = __detail::_Local_const_iterator<
   key_type, _Value,
   _ExtractKey, _Hash, _RangeHash, _Unused,
   __constant_iterators::value, __hash_cached::value>;

    private:
      using __rehash_type = _RehashPolicy;
      using __rehash_state = typename __rehash_type::_State;

      using __unique_keys = typename __traits_type::__unique_keys;

      using __hashtable_base = __detail::
 _Hashtable_base<_Key, _Value, _ExtractKey,
   _Equal, _Hash, _RangeHash, _Unused, _Traits>;

      using __hash_code_base = typename __hashtable_base::__hash_code_base;
      using __hash_code = typename __hashtable_base::__hash_code;
      using __ireturn_type = typename __insert_base::__ireturn_type;

      using __map_base = __detail::_Map_base<_Key, _Value, _Alloc, _ExtractKey,
          _Equal, _Hash, _RangeHash, _Unused,
          _RehashPolicy, _Traits>;

      using __rehash_base = __detail::_Rehash_base<_Key, _Value, _Alloc,
         _ExtractKey, _Equal,
         _Hash, _RangeHash, _Unused,
         _RehashPolicy, _Traits>;

      using __eq_base = __detail::_Equality<_Key, _Value, _Alloc, _ExtractKey,
         _Equal, _Hash, _RangeHash, _Unused,
         _RehashPolicy, _Traits>;

      using __reuse_or_alloc_node_gen_t =
 __detail::_ReuseOrAllocNode<__node_alloc_type>;
      using __alloc_node_gen_t =
 __detail::_AllocNode<__node_alloc_type>;


      struct _Scoped_node
      {

 _Scoped_node(__node_ptr __n, __hashtable_alloc* __h)
 : _M_h(__h), _M_node(__n) { }


 template<typename... _Args>
   _Scoped_node(__hashtable_alloc* __h, _Args&&... __args)
   : _M_h(__h),
     _M_node(__h->_M_allocate_node(std::forward<_Args>(__args)...))
   { }


 ~_Scoped_node() { if (_M_node) _M_h->_M_deallocate_node(_M_node); };

 _Scoped_node(const _Scoped_node&) = delete;
 _Scoped_node& operator=(const _Scoped_node&) = delete;

 __hashtable_alloc* _M_h;
 __node_ptr _M_node;
      };

      template<typename _Ht>
 static constexpr
 typename conditional<std::is_lvalue_reference<_Ht>::value,
        const value_type&, value_type&&>::type
 __fwd_value_for(value_type& __val) noexcept
 { return std::move(__val); }





      struct __hash_code_base_access : __hash_code_base
      { using __hash_code_base::_M_bucket_index; };



      static_assert(noexcept(declval<const __hash_code_base_access&>()
   ._M_bucket_index(declval<const __node_value_type&>(),
      (std::size_t)0)),
      "Cache the hash code or qualify your functors involved"
      " in hash code and bucket index computation with noexcept");


      static_assert(is_nothrow_default_constructible<_RangeHash>::value,
      "Functor used to map hash code to bucket index"
      " must be nothrow default constructible");
      static_assert(noexcept(
 std::declval<const _RangeHash&>()((std::size_t)0, (std::size_t)0)),
      "Functor used to map hash code to bucket index must be"
      " noexcept");


      static_assert(is_nothrow_default_constructible<_ExtractKey>::value,
      "_ExtractKey must be nothrow default constructible");
      static_assert(noexcept(
 std::declval<const _ExtractKey&>()(std::declval<_Value>())),
      "_ExtractKey functor must be noexcept invocable");

      template<typename _Keya, typename _Valuea, typename _Alloca,
        typename _ExtractKeya, typename _Equala,
        typename _Hasha, typename _RangeHasha, typename _Unuseda,
        typename _RehashPolicya, typename _Traitsa,
        bool _Unique_keysa>
 friend struct __detail::_Map_base;

      template<typename _Keya, typename _Valuea, typename _Alloca,
        typename _ExtractKeya, typename _Equala,
        typename _Hasha, typename _RangeHasha, typename _Unuseda,
        typename _RehashPolicya, typename _Traitsa>
 friend struct __detail::_Insert_base;

      template<typename _Keya, typename _Valuea, typename _Alloca,
        typename _ExtractKeya, typename _Equala,
        typename _Hasha, typename _RangeHasha, typename _Unuseda,
        typename _RehashPolicya, typename _Traitsa,
        bool _Constant_iteratorsa>
 friend struct __detail::_Insert;

      template<typename _Keya, typename _Valuea, typename _Alloca,
        typename _ExtractKeya, typename _Equala,
        typename _Hasha, typename _RangeHasha, typename _Unuseda,
        typename _RehashPolicya, typename _Traitsa,
        bool _Unique_keysa>
 friend struct __detail::_Equality;

    public:
      using size_type = typename __hashtable_base::size_type;
      using difference_type = typename __hashtable_base::difference_type;






    private:
      __buckets_ptr _M_buckets = &_M_single_bucket;
      size_type _M_bucket_count = 1;
      __node_base _M_before_begin;
      size_type _M_element_count = 0;
      _RehashPolicy _M_rehash_policy;







      __node_base_ptr _M_single_bucket = nullptr;

      void
      _M_update_bbegin()
      {
 if (_M_begin())
   _M_buckets[_M_bucket_index(*_M_begin())] = &_M_before_begin;
      }

      void
      _M_update_bbegin(__node_ptr __n)
      {
 _M_before_begin._M_nxt = __n;
 _M_update_bbegin();
      }

      bool
      _M_uses_single_bucket(__buckets_ptr __bkts) const
      { return __builtin_expect(__bkts == &_M_single_bucket, false); }

      bool
      _M_uses_single_bucket() const
      { return _M_uses_single_bucket(_M_buckets); }

      __hashtable_alloc&
      _M_base_alloc() { return *this; }

      __buckets_ptr
      _M_allocate_buckets(size_type __bkt_count)
      {
 if (__builtin_expect(__bkt_count == 1, false))
   {
     _M_single_bucket = nullptr;
     return &_M_single_bucket;
   }

 return __hashtable_alloc::_M_allocate_buckets(__bkt_count);
      }

      void
      _M_deallocate_buckets(__buckets_ptr __bkts, size_type __bkt_count)
      {
 if (_M_uses_single_bucket(__bkts))
   return;

 __hashtable_alloc::_M_deallocate_buckets(__bkts, __bkt_count);
      }

      void
      _M_deallocate_buckets()
      { _M_deallocate_buckets(_M_buckets, _M_bucket_count); }



      __node_ptr
      _M_bucket_begin(size_type __bkt) const;

      __node_ptr
      _M_begin() const
      { return static_cast<__node_ptr>(_M_before_begin._M_nxt); }



      template<typename _Ht>
 void
 _M_assign_elements(_Ht&&);

      template<typename _Ht, typename _NodeGenerator>
 void
 _M_assign(_Ht&&, const _NodeGenerator&);

      void
      _M_move_assign(_Hashtable&&, true_type);

      void
      _M_move_assign(_Hashtable&&, false_type);

      void
      _M_reset() noexcept;

      _Hashtable(const _Hash& __h, const _Equal& __eq,
   const allocator_type& __a)
      : __hashtable_base(__h, __eq),
 __hashtable_alloc(__node_alloc_type(__a)),
 __enable_default_ctor(_Enable_default_constructor_tag{})
      { }

      template<bool _No_realloc = true>
 static constexpr bool
 _S_nothrow_move()
 {

   return __and_<__bool_constant<_No_realloc>,
   is_nothrow_copy_constructible<_Hash>,
   is_nothrow_copy_constructible<_Equal>>::value;






 }

      _Hashtable(_Hashtable&& __ht, __node_alloc_type&& __a,
   true_type )
 noexcept(_S_nothrow_move());

      _Hashtable(_Hashtable&&, __node_alloc_type&&,
   false_type );

      template<typename _InputIterator>
 _Hashtable(_InputIterator __first, _InputIterator __last,
     size_type __bkt_count_hint,
     const _Hash&, const _Equal&, const allocator_type&,
     true_type __uks);

      template<typename _InputIterator>
 _Hashtable(_InputIterator __first, _InputIterator __last,
     size_type __bkt_count_hint,
     const _Hash&, const _Equal&, const allocator_type&,
     false_type __uks);

    public:

      _Hashtable() = default;

      _Hashtable(const _Hashtable&);

      _Hashtable(const _Hashtable&, const allocator_type&);

      explicit
      _Hashtable(size_type __bkt_count_hint,
   const _Hash& __hf = _Hash(),
   const key_equal& __eql = key_equal(),
   const allocator_type& __a = allocator_type());


      _Hashtable(_Hashtable&& __ht)
 noexcept(_S_nothrow_move())
      : _Hashtable(std::move(__ht), std::move(__ht._M_node_allocator()),
     true_type{})
      { }

      _Hashtable(_Hashtable&& __ht, const allocator_type& __a)
 noexcept(_S_nothrow_move<__node_alloc_traits::_S_always_equal()>())
      : _Hashtable(std::move(__ht), __node_alloc_type(__a),
     typename __node_alloc_traits::is_always_equal{})
      { }

      explicit
      _Hashtable(const allocator_type& __a)
      : __hashtable_alloc(__node_alloc_type(__a)),
 __enable_default_ctor(_Enable_default_constructor_tag{})
      { }

      template<typename _InputIterator>
 _Hashtable(_InputIterator __f, _InputIterator __l,
     size_type __bkt_count_hint = 0,
     const _Hash& __hf = _Hash(),
     const key_equal& __eql = key_equal(),
     const allocator_type& __a = allocator_type())
 : _Hashtable(__f, __l, __bkt_count_hint, __hf, __eql, __a,
       __unique_keys{})
 { }

      _Hashtable(initializer_list<value_type> __l,
   size_type __bkt_count_hint = 0,
   const _Hash& __hf = _Hash(),
   const key_equal& __eql = key_equal(),
   const allocator_type& __a = allocator_type())
      : _Hashtable(__l.begin(), __l.end(), __bkt_count_hint,
     __hf, __eql, __a, __unique_keys{})
      { }

      _Hashtable&
      operator=(const _Hashtable& __ht);

      _Hashtable&
      operator=(_Hashtable&& __ht)
      noexcept(__node_alloc_traits::_S_nothrow_move()
        && is_nothrow_move_assignable<_Hash>::value
        && is_nothrow_move_assignable<_Equal>::value)
      {
 constexpr bool __move_storage =
   __node_alloc_traits::_S_propagate_on_move_assign()
   || __node_alloc_traits::_S_always_equal();
 _M_move_assign(std::move(__ht), __bool_constant<__move_storage>());
 return *this;
      }

      _Hashtable&
      operator=(initializer_list<value_type> __l)
      {
 __reuse_or_alloc_node_gen_t __roan(_M_begin(), *this);
 _M_before_begin._M_nxt = nullptr;
 clear();


 auto __l_bkt_count = _M_rehash_policy._M_bkt_for_elements(__l.size());


 if (_M_bucket_count < __l_bkt_count)
   rehash(__l_bkt_count);

 this->_M_insert_range(__l.begin(), __l.end(), __roan, __unique_keys{});
 return *this;
      }

      ~_Hashtable() noexcept;

      void
      swap(_Hashtable&)
      noexcept(__and_<__is_nothrow_swappable<_Hash>,
        __is_nothrow_swappable<_Equal>>::value);


      iterator
      begin() noexcept
      { return iterator(_M_begin()); }

      const_iterator
      begin() const noexcept
      { return const_iterator(_M_begin()); }

      iterator
      end() noexcept
      { return iterator(nullptr); }

      const_iterator
      end() const noexcept
      { return const_iterator(nullptr); }

      const_iterator
      cbegin() const noexcept
      { return const_iterator(_M_begin()); }

      const_iterator
      cend() const noexcept
      { return const_iterator(nullptr); }

      size_type
      size() const noexcept
      { return _M_element_count; }

                         bool
      empty() const noexcept
      { return size() == 0; }

      allocator_type
      get_allocator() const noexcept
      { return allocator_type(this->_M_node_allocator()); }

      size_type
      max_size() const noexcept
      { return __node_alloc_traits::max_size(this->_M_node_allocator()); }


      key_equal
      key_eq() const
      { return this->_M_eq(); }




      size_type
      bucket_count() const noexcept
      { return _M_bucket_count; }

      size_type
      max_bucket_count() const noexcept
      { return max_size(); }

      size_type
      bucket_size(size_type __bkt) const
      { return std::distance(begin(__bkt), end(__bkt)); }

      size_type
      bucket(const key_type& __k) const
      { return _M_bucket_index(this->_M_hash_code(__k)); }

      local_iterator
      begin(size_type __bkt)
      {
 return local_iterator(*this, _M_bucket_begin(__bkt),
         __bkt, _M_bucket_count);
      }

      local_iterator
      end(size_type __bkt)
      { return local_iterator(*this, nullptr, __bkt, _M_bucket_count); }

      const_local_iterator
      begin(size_type __bkt) const
      {
 return const_local_iterator(*this, _M_bucket_begin(__bkt),
        __bkt, _M_bucket_count);
      }

      const_local_iterator
      end(size_type __bkt) const
      { return const_local_iterator(*this, nullptr, __bkt, _M_bucket_count); }


      const_local_iterator
      cbegin(size_type __bkt) const
      {
 return const_local_iterator(*this, _M_bucket_begin(__bkt),
        __bkt, _M_bucket_count);
      }

      const_local_iterator
      cend(size_type __bkt) const
      { return const_local_iterator(*this, nullptr, __bkt, _M_bucket_count); }

      float
      load_factor() const noexcept
      {
 return static_cast<float>(size()) / static_cast<float>(bucket_count());
      }






      const _RehashPolicy&
      __rehash_policy() const
      { return _M_rehash_policy; }

      void
      __rehash_policy(const _RehashPolicy& __pol)
      { _M_rehash_policy = __pol; }


      iterator
      find(const key_type& __k);

      const_iterator
      find(const key_type& __k) const;

      size_type
      count(const key_type& __k) const;

      std::pair<iterator, iterator>
      equal_range(const key_type& __k);

      std::pair<const_iterator, const_iterator>
      equal_range(const key_type& __k) const;
# 787 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 3
    private:

      size_type
      _M_bucket_index(const __node_value_type& __n) const noexcept
      { return __hash_code_base::_M_bucket_index(__n, _M_bucket_count); }

      size_type
      _M_bucket_index(__hash_code __c) const
      { return __hash_code_base::_M_bucket_index(__c, _M_bucket_count); }



      __node_base_ptr
      _M_find_before_node(size_type, const key_type&, __hash_code) const;

      template<typename _Kt>
 __node_base_ptr
 _M_find_before_node_tr(size_type, const _Kt&, __hash_code) const;

      __node_ptr
      _M_find_node(size_type __bkt, const key_type& __key,
     __hash_code __c) const
      {
 __node_base_ptr __before_n = _M_find_before_node(__bkt, __key, __c);
 if (__before_n)
   return static_cast<__node_ptr>(__before_n->_M_nxt);
 return nullptr;
      }

      template<typename _Kt>
 __node_ptr
 _M_find_node_tr(size_type __bkt, const _Kt& __key,
   __hash_code __c) const
 {
   auto __before_n = _M_find_before_node_tr(__bkt, __key, __c);
   if (__before_n)
     return static_cast<__node_ptr>(__before_n->_M_nxt);
   return nullptr;
 }


      void
      _M_insert_bucket_begin(size_type, __node_ptr);


      void
      _M_remove_bucket_begin(size_type __bkt, __node_ptr __next_n,
        size_type __next_bkt);


      __node_base_ptr
      _M_get_previous_node(size_type __bkt, __node_ptr __n);




      iterator
      _M_insert_unique_node(size_type __bkt, __hash_code,
       __node_ptr __n, size_type __n_elt = 1);



      iterator
      _M_insert_multi_node(__node_ptr __hint,
      __hash_code __code, __node_ptr __n);

      template<typename... _Args>
 std::pair<iterator, bool>
 _M_emplace(true_type __uks, _Args&&... __args);

      template<typename... _Args>
 iterator
 _M_emplace(false_type __uks, _Args&&... __args)
 { return _M_emplace(cend(), __uks, std::forward<_Args>(__args)...); }


      template<typename... _Args>
 iterator
 _M_emplace(const_iterator, true_type __uks, _Args&&... __args)
 { return _M_emplace(__uks, std::forward<_Args>(__args)...).first; }

      template<typename... _Args>
 iterator
 _M_emplace(const_iterator, false_type __uks, _Args&&... __args);

      template<typename _Arg, typename _NodeGenerator>
 std::pair<iterator, bool>
 _M_insert(_Arg&&, const _NodeGenerator&, true_type __uks);

      template<typename _Arg, typename _NodeGenerator>
 iterator
 _M_insert(_Arg&& __arg, const _NodeGenerator& __node_gen,
    false_type __uks)
 {
   return _M_insert(cend(), std::forward<_Arg>(__arg), __node_gen,
      __uks);
 }


      template<typename _Arg, typename _NodeGenerator>
 iterator
 _M_insert(const_iterator, _Arg&& __arg,
    const _NodeGenerator& __node_gen, true_type __uks)
 {
   return
     _M_insert(std::forward<_Arg>(__arg), __node_gen, __uks).first;
 }


      template<typename _Arg, typename _NodeGenerator>
 iterator
 _M_insert(const_iterator, _Arg&&,
    const _NodeGenerator&, false_type __uks);

      size_type
      _M_erase(true_type __uks, const key_type&);

      size_type
      _M_erase(false_type __uks, const key_type&);

      iterator
      _M_erase(size_type __bkt, __node_base_ptr __prev_n, __node_ptr __n);

    public:

      template<typename... _Args>
 __ireturn_type
 emplace(_Args&&... __args)
 { return _M_emplace(__unique_keys{}, std::forward<_Args>(__args)...); }

      template<typename... _Args>
 iterator
 emplace_hint(const_iterator __hint, _Args&&... __args)
 {
   return _M_emplace(__hint, __unique_keys{},
       std::forward<_Args>(__args)...);
 }




      iterator
      erase(const_iterator);


      iterator
      erase(iterator __it)
      { return erase(const_iterator(__it)); }

      size_type
      erase(const key_type& __k)
      { return _M_erase(__unique_keys{}, __k); }

      iterator
      erase(const_iterator, const_iterator);

      void
      clear() noexcept;



      void rehash(size_type __bkt_count);
# 1088 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 3
    private:

      void _M_rehash_aux(size_type __bkt_count, true_type __uks);


      void _M_rehash_aux(size_type __bkt_count, false_type __uks);



      void _M_rehash(size_type __bkt_count, const __rehash_state& __state);
    };



  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_bucket_begin(size_type __bkt) const
    -> __node_ptr
    {
      __node_base_ptr __n = _M_buckets[__bkt];
      return __n ? static_cast<__node_ptr>(__n->_M_nxt) : nullptr;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _Hashtable(size_type __bkt_count_hint,
        const _Hash& __h, const _Equal& __eq, const allocator_type& __a)
    : _Hashtable(__h, __eq, __a)
    {
      auto __bkt_count = _M_rehash_policy._M_next_bkt(__bkt_count_hint);
      if (__bkt_count > _M_bucket_count)
 {
   _M_buckets = _M_allocate_buckets(__bkt_count);
   _M_bucket_count = __bkt_count;
 }
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _InputIterator>
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _Hashtable(_InputIterator __f, _InputIterator __l,
   size_type __bkt_count_hint,
   const _Hash& __h, const _Equal& __eq,
   const allocator_type& __a, true_type )
      : _Hashtable(__bkt_count_hint, __h, __eq, __a)
      {
 for (; __f != __l; ++__f)
   this->insert(*__f);
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _InputIterator>
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _Hashtable(_InputIterator __f, _InputIterator __l,
   size_type __bkt_count_hint,
   const _Hash& __h, const _Equal& __eq,
   const allocator_type& __a, false_type )
      : _Hashtable(__h, __eq, __a)
      {
 auto __nb_elems = __detail::__distance_fw(__f, __l);
 auto __bkt_count =
   _M_rehash_policy._M_next_bkt(
     std::max(_M_rehash_policy._M_bkt_for_elements(__nb_elems),
       __bkt_count_hint));

 if (__bkt_count > _M_bucket_count)
   {
     _M_buckets = _M_allocate_buckets(__bkt_count);
     _M_bucket_count = __bkt_count;
   }

 for (; __f != __l; ++__f)
   this->insert(*__f);
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    operator=(const _Hashtable& __ht)
    -> _Hashtable&
    {
      if (&__ht == this)
 return *this;

      if (__node_alloc_traits::_S_propagate_on_copy_assign())
 {
   auto& __this_alloc = this->_M_node_allocator();
   auto& __that_alloc = __ht._M_node_allocator();
   if (!__node_alloc_traits::_S_always_equal()
       && __this_alloc != __that_alloc)
     {

       this->_M_deallocate_nodes(_M_begin());
       _M_before_begin._M_nxt = nullptr;
       _M_deallocate_buckets();
       _M_buckets = nullptr;
       std::__alloc_on_copy(__this_alloc, __that_alloc);
       __hashtable_base::operator=(__ht);
       _M_bucket_count = __ht._M_bucket_count;
       _M_element_count = __ht._M_element_count;
       _M_rehash_policy = __ht._M_rehash_policy;
       __alloc_node_gen_t __alloc_node_gen(*this);
       try
  {
    _M_assign(__ht, __alloc_node_gen);
  }
       catch(...)
  {


    _M_reset();
    throw;
  }
       return *this;
     }
   std::__alloc_on_copy(__this_alloc, __that_alloc);
 }


      _M_assign_elements(__ht);
      return *this;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _Ht>
      void
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _M_assign_elements(_Ht&& __ht)
      {
 __buckets_ptr __former_buckets = nullptr;
 std::size_t __former_bucket_count = _M_bucket_count;
 const __rehash_state& __former_state = _M_rehash_policy._M_state();

 if (_M_bucket_count != __ht._M_bucket_count)
   {
     __former_buckets = _M_buckets;
     _M_buckets = _M_allocate_buckets(__ht._M_bucket_count);
     _M_bucket_count = __ht._M_bucket_count;
   }
 else
   __builtin_memset(_M_buckets, 0,
      _M_bucket_count * sizeof(__node_base_ptr));

 try
   {
     __hashtable_base::operator=(std::forward<_Ht>(__ht));
     _M_element_count = __ht._M_element_count;
     _M_rehash_policy = __ht._M_rehash_policy;
     __reuse_or_alloc_node_gen_t __roan(_M_begin(), *this);
     _M_before_begin._M_nxt = nullptr;
     _M_assign(std::forward<_Ht>(__ht), __roan);
     if (__former_buckets)
       _M_deallocate_buckets(__former_buckets, __former_bucket_count);
   }
 catch(...)
   {
     if (__former_buckets)
       {

  _M_deallocate_buckets();
  _M_rehash_policy._M_reset(__former_state);
  _M_buckets = __former_buckets;
  _M_bucket_count = __former_bucket_count;
       }
     __builtin_memset(_M_buckets, 0,
        _M_bucket_count * sizeof(__node_base_ptr));
     throw;
   }
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _Ht, typename _NodeGenerator>
      void
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _M_assign(_Ht&& __ht, const _NodeGenerator& __node_gen)
      {
 __buckets_ptr __buckets = nullptr;
 if (!_M_buckets)
   _M_buckets = __buckets = _M_allocate_buckets(_M_bucket_count);

 try
   {
     if (!__ht._M_before_begin._M_nxt)
       return;



     __node_ptr __ht_n = __ht._M_begin();
     __node_ptr __this_n
       = __node_gen(__fwd_value_for<_Ht>(__ht_n->_M_v()));
     this->_M_copy_code(*__this_n, *__ht_n);
     _M_update_bbegin(__this_n);


     __node_ptr __prev_n = __this_n;
     for (__ht_n = __ht_n->_M_next(); __ht_n; __ht_n = __ht_n->_M_next())
       {
  __this_n = __node_gen(__fwd_value_for<_Ht>(__ht_n->_M_v()));
  __prev_n->_M_nxt = __this_n;
  this->_M_copy_code(*__this_n, *__ht_n);
  size_type __bkt = _M_bucket_index(*__this_n);
  if (!_M_buckets[__bkt])
    _M_buckets[__bkt] = __prev_n;
  __prev_n = __this_n;
       }
   }
 catch(...)
   {
     clear();
     if (__buckets)
       _M_deallocate_buckets();
     throw;
   }
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_reset() noexcept
    {
      _M_rehash_policy._M_reset();
      _M_bucket_count = 1;
      _M_single_bucket = nullptr;
      _M_buckets = &_M_single_bucket;
      _M_before_begin._M_nxt = nullptr;
      _M_element_count = 0;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_move_assign(_Hashtable&& __ht, true_type)
    {
      if (__builtin_expect(std::__addressof(__ht) == this, false))
 return;

      this->_M_deallocate_nodes(_M_begin());
      _M_deallocate_buckets();
      __hashtable_base::operator=(std::move(__ht));
      _M_rehash_policy = __ht._M_rehash_policy;
      if (!__ht._M_uses_single_bucket())
 _M_buckets = __ht._M_buckets;
      else
 {
   _M_buckets = &_M_single_bucket;
   _M_single_bucket = __ht._M_single_bucket;
 }

      _M_bucket_count = __ht._M_bucket_count;
      _M_before_begin._M_nxt = __ht._M_before_begin._M_nxt;
      _M_element_count = __ht._M_element_count;
      std::__alloc_on_move(this->_M_node_allocator(), __ht._M_node_allocator());


      _M_update_bbegin();
      __ht._M_reset();
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_move_assign(_Hashtable&& __ht, false_type)
    {
      if (__ht._M_node_allocator() == this->_M_node_allocator())
 _M_move_assign(std::move(__ht), true_type{});
      else
 {

   _M_assign_elements(std::move(__ht));
   __ht.clear();
 }
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _Hashtable(const _Hashtable& __ht)
    : __hashtable_base(__ht),
      __map_base(__ht),
      __rehash_base(__ht),
      __hashtable_alloc(
 __node_alloc_traits::_S_select_on_copy(__ht._M_node_allocator())),
      __enable_default_ctor(__ht),
      _M_buckets(nullptr),
      _M_bucket_count(__ht._M_bucket_count),
      _M_element_count(__ht._M_element_count),
      _M_rehash_policy(__ht._M_rehash_policy)
    {
      __alloc_node_gen_t __alloc_node_gen(*this);
      _M_assign(__ht, __alloc_node_gen);
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _Hashtable(_Hashtable&& __ht, __node_alloc_type&& __a,
        true_type )
    noexcept(_S_nothrow_move())
    : __hashtable_base(__ht),
      __map_base(__ht),
      __rehash_base(__ht),
      __hashtable_alloc(std::move(__a)),
      __enable_default_ctor(__ht),
      _M_buckets(__ht._M_buckets),
      _M_bucket_count(__ht._M_bucket_count),
      _M_before_begin(__ht._M_before_begin._M_nxt),
      _M_element_count(__ht._M_element_count),
      _M_rehash_policy(__ht._M_rehash_policy)
    {

      if (__ht._M_uses_single_bucket())
 {
   _M_buckets = &_M_single_bucket;
   _M_single_bucket = __ht._M_single_bucket;
 }


      _M_update_bbegin();

      __ht._M_reset();
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _Hashtable(const _Hashtable& __ht, const allocator_type& __a)
    : __hashtable_base(__ht),
      __map_base(__ht),
      __rehash_base(__ht),
      __hashtable_alloc(__node_alloc_type(__a)),
      __enable_default_ctor(__ht),
      _M_buckets(),
      _M_bucket_count(__ht._M_bucket_count),
      _M_element_count(__ht._M_element_count),
      _M_rehash_policy(__ht._M_rehash_policy)
    {
      __alloc_node_gen_t __alloc_node_gen(*this);
      _M_assign(__ht, __alloc_node_gen);
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _Hashtable(_Hashtable&& __ht, __node_alloc_type&& __a,
        false_type )
    : __hashtable_base(__ht),
      __map_base(__ht),
      __rehash_base(__ht),
      __hashtable_alloc(std::move(__a)),
      __enable_default_ctor(__ht),
      _M_buckets(nullptr),
      _M_bucket_count(__ht._M_bucket_count),
      _M_element_count(__ht._M_element_count),
      _M_rehash_policy(__ht._M_rehash_policy)
    {
      if (__ht._M_node_allocator() == this->_M_node_allocator())
 {
   if (__ht._M_uses_single_bucket())
     {
       _M_buckets = &_M_single_bucket;
       _M_single_bucket = __ht._M_single_bucket;
     }
   else
     _M_buckets = __ht._M_buckets;



   _M_update_bbegin(__ht._M_begin());

   __ht._M_reset();
 }
      else
 {
   __alloc_node_gen_t __alloc_gen(*this);

   using _Fwd_Ht = typename
     conditional<__move_if_noexcept_cond<value_type>::value,
   const _Hashtable&, _Hashtable&&>::type;
   _M_assign(std::forward<_Fwd_Ht>(__ht), __alloc_gen);
   __ht.clear();
 }
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    ~_Hashtable() noexcept
    {
      clear();
      _M_deallocate_buckets();
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    swap(_Hashtable& __x)
    noexcept(__and_<__is_nothrow_swappable<_Hash>,
   __is_nothrow_swappable<_Equal>>::value)
    {



      this->_M_swap(__x);

      std::__alloc_on_swap(this->_M_node_allocator(), __x._M_node_allocator());
      std::swap(_M_rehash_policy, __x._M_rehash_policy);


      if (this->_M_uses_single_bucket())
 {
   if (!__x._M_uses_single_bucket())
     {
       _M_buckets = __x._M_buckets;
       __x._M_buckets = &__x._M_single_bucket;
     }
 }
      else if (__x._M_uses_single_bucket())
 {
   __x._M_buckets = _M_buckets;
   _M_buckets = &_M_single_bucket;
 }
      else
 std::swap(_M_buckets, __x._M_buckets);

      std::swap(_M_bucket_count, __x._M_bucket_count);
      std::swap(_M_before_begin._M_nxt, __x._M_before_begin._M_nxt);
      std::swap(_M_element_count, __x._M_element_count);
      std::swap(_M_single_bucket, __x._M_single_bucket);



      _M_update_bbegin();
      __x._M_update_bbegin();
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    find(const key_type& __k)
    -> iterator
    {
      __hash_code __code = this->_M_hash_code(__k);
      std::size_t __bkt = _M_bucket_index(__code);
      return iterator(_M_find_node(__bkt, __k, __code));
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    find(const key_type& __k) const
    -> const_iterator
    {
      __hash_code __code = this->_M_hash_code(__k);
      std::size_t __bkt = _M_bucket_index(__code);
      return const_iterator(_M_find_node(__bkt, __k, __code));
    }
# 1647 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 3
  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    count(const key_type& __k) const
    -> size_type
    {
      auto __it = find(__k);
      if (!__it._M_cur)
 return 0;

      if (__unique_keys::value)
 return 1;




      size_type __result = 1;
      for (auto __ref = __it++;
    __it._M_cur && this->_M_node_equals(*__ref._M_cur, *__it._M_cur);
    ++__it)
 ++__result;

      return __result;
    }
# 1708 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 3
  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    equal_range(const key_type& __k)
    -> pair<iterator, iterator>
    {
      auto __ite = find(__k);
      if (!__ite._M_cur)
 return { __ite, __ite };

      auto __beg = __ite++;
      if (__unique_keys::value)
 return { __beg, __ite };




      while (__ite._M_cur && this->_M_node_equals(*__beg._M_cur, *__ite._M_cur))
 ++__ite;

      return { __beg, __ite };
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    equal_range(const key_type& __k) const
    -> pair<const_iterator, const_iterator>
    {
      auto __ite = find(__k);
      if (!__ite._M_cur)
 return { __ite, __ite };

      auto __beg = __ite++;
      if (__unique_keys::value)
 return { __beg, __ite };




      while (__ite._M_cur && this->_M_node_equals(*__beg._M_cur, *__ite._M_cur))
 ++__ite;

      return { __beg, __ite };
    }
# 1822 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 3
  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_find_before_node(size_type __bkt, const key_type& __k,
   __hash_code __code) const
    -> __node_base_ptr
    {
      __node_base_ptr __prev_p = _M_buckets[__bkt];
      if (!__prev_p)
 return nullptr;

      for (__node_ptr __p = static_cast<__node_ptr>(__prev_p->_M_nxt);;
    __p = __p->_M_next())
 {
   if (this->_M_equals(__k, __code, *__p))
     return __prev_p;

   if (!__p->_M_nxt || _M_bucket_index(*__p->_M_next()) != __bkt)
     break;
   __prev_p = __p;
 }

      return nullptr;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _Kt>
      auto
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _M_find_before_node_tr(size_type __bkt, const _Kt& __k,
        __hash_code __code) const
      -> __node_base_ptr
      {
 __node_base_ptr __prev_p = _M_buckets[__bkt];
 if (!__prev_p)
   return nullptr;

 for (__node_ptr __p = static_cast<__node_ptr>(__prev_p->_M_nxt);;
      __p = __p->_M_next())
   {
     if (this->_M_equals_tr(__k, __code, *__p))
       return __prev_p;

     if (!__p->_M_nxt || _M_bucket_index(*__p->_M_next()) != __bkt)
       break;
     __prev_p = __p;
   }

 return nullptr;
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_insert_bucket_begin(size_type __bkt, __node_ptr __node)
    {
      if (_M_buckets[__bkt])
 {


   __node->_M_nxt = _M_buckets[__bkt]->_M_nxt;
   _M_buckets[__bkt]->_M_nxt = __node;
 }
      else
 {



   __node->_M_nxt = _M_before_begin._M_nxt;
   _M_before_begin._M_nxt = __node;

   if (__node->_M_nxt)


     _M_buckets[_M_bucket_index(*__node->_M_next())] = __node;

   _M_buckets[__bkt] = &_M_before_begin;
 }
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_remove_bucket_begin(size_type __bkt, __node_ptr __next,
      size_type __next_bkt)
    {
      if (!__next || __next_bkt != __bkt)
 {


   if (__next)
     _M_buckets[__next_bkt] = _M_buckets[__bkt];


   if (&_M_before_begin == _M_buckets[__bkt])
     _M_before_begin._M_nxt = __next;
   _M_buckets[__bkt] = nullptr;
 }
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_get_previous_node(size_type __bkt, __node_ptr __n)
    -> __node_base_ptr
    {
      __node_base_ptr __prev_n = _M_buckets[__bkt];
      while (__prev_n->_M_nxt != __n)
 __prev_n = __prev_n->_M_nxt;
      return __prev_n;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename... _Args>
      auto
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _M_emplace(true_type , _Args&&... __args)
      -> pair<iterator, bool>
      {

 _Scoped_node __node { this, std::forward<_Args>(__args)... };
 const key_type& __k = _ExtractKey{}(__node._M_node->_M_v());
 __hash_code __code = this->_M_hash_code(__k);
 size_type __bkt = _M_bucket_index(__code);
 if (__node_ptr __p = _M_find_node(__bkt, __k, __code))

   return std::make_pair(iterator(__p), false);


 auto __pos = _M_insert_unique_node(__bkt, __code, __node._M_node);
 __node._M_node = nullptr;
 return { __pos, true };
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename... _Args>
      auto
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _M_emplace(const_iterator __hint, false_type ,
   _Args&&... __args)
      -> iterator
      {

 _Scoped_node __node { this, std::forward<_Args>(__args)... };
 const key_type& __k = _ExtractKey{}(__node._M_node->_M_v());

 __hash_code __code = this->_M_hash_code(__k);
 auto __pos
   = _M_insert_multi_node(__hint._M_cur, __code, __node._M_node);
 __node._M_node = nullptr;
 return __pos;
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_insert_unique_node(size_type __bkt, __hash_code __code,
     __node_ptr __node, size_type __n_elt)
    -> iterator
    {
      const __rehash_state& __saved_state = _M_rehash_policy._M_state();
      std::pair<bool, std::size_t> __do_rehash
 = _M_rehash_policy._M_need_rehash(_M_bucket_count, _M_element_count,
       __n_elt);

      if (__do_rehash.first)
 {
   _M_rehash(__do_rehash.second, __saved_state);
   __bkt = _M_bucket_index(__code);
 }

      this->_M_store_code(*__node, __code);


      _M_insert_bucket_begin(__bkt, __node);
      ++_M_element_count;
      return iterator(__node);
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_insert_multi_node(__node_ptr __hint,
    __hash_code __code, __node_ptr __node)
    -> iterator
    {
      const __rehash_state& __saved_state = _M_rehash_policy._M_state();
      std::pair<bool, std::size_t> __do_rehash
 = _M_rehash_policy._M_need_rehash(_M_bucket_count, _M_element_count, 1);

      if (__do_rehash.first)
 _M_rehash(__do_rehash.second, __saved_state);

      this->_M_store_code(*__node, __code);
      const key_type& __k = _ExtractKey{}(__node->_M_v());
      size_type __bkt = _M_bucket_index(__code);



      __node_base_ptr __prev
 = __builtin_expect(__hint != nullptr, false)
   && this->_M_equals(__k, __code, *__hint)
     ? __hint
     : _M_find_before_node(__bkt, __k, __code);

      if (__prev)
 {

   __node->_M_nxt = __prev->_M_nxt;
   __prev->_M_nxt = __node;
   if (__builtin_expect(__prev == __hint, false))


     if (__node->_M_nxt
  && !this->_M_equals(__k, __code, *__node->_M_next()))
       {
  size_type __next_bkt = _M_bucket_index(*__node->_M_next());
  if (__next_bkt != __bkt)
    _M_buckets[__next_bkt] = __node;
       }
 }
      else



 _M_insert_bucket_begin(__bkt, __node);
      ++_M_element_count;
      return iterator(__node);
    }


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _Arg, typename _NodeGenerator>
      auto
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _M_insert(_Arg&& __v, const _NodeGenerator& __node_gen,
  true_type )
      -> pair<iterator, bool>
      {
 const key_type& __k = _ExtractKey{}(__v);
 __hash_code __code = this->_M_hash_code(__k);
 size_type __bkt = _M_bucket_index(__code);

 if (__node_ptr __node = _M_find_node(__bkt, __k, __code))
   return { iterator(__node), false };

 _Scoped_node __node{ __node_gen(std::forward<_Arg>(__v)), this };
 auto __pos
   = _M_insert_unique_node(__bkt, __code, __node._M_node);
 __node._M_node = nullptr;
 return { __pos, true };
      }


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    template<typename _Arg, typename _NodeGenerator>
      auto
      _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
   _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
      _M_insert(const_iterator __hint, _Arg&& __v,
  const _NodeGenerator& __node_gen,
  false_type )
      -> iterator
      {


 __hash_code __code = this->_M_hash_code(_ExtractKey{}(__v));


 _Scoped_node __node{ __node_gen(std::forward<_Arg>(__v)), this };
 auto __pos
   = _M_insert_multi_node(__hint._M_cur, __code, __node._M_node);
 __node._M_node = nullptr;
 return __pos;
      }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    erase(const_iterator __it)
    -> iterator
    {
      __node_ptr __n = __it._M_cur;
      std::size_t __bkt = _M_bucket_index(*__n);




      __node_base_ptr __prev_n = _M_get_previous_node(__bkt, __n);
      return _M_erase(__bkt, __prev_n, __n);
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_erase(size_type __bkt, __node_base_ptr __prev_n, __node_ptr __n)
    -> iterator
    {
      if (__prev_n == _M_buckets[__bkt])
 _M_remove_bucket_begin(__bkt, __n->_M_next(),
   __n->_M_nxt ? _M_bucket_index(*__n->_M_next()) : 0);
      else if (__n->_M_nxt)
 {
   size_type __next_bkt = _M_bucket_index(*__n->_M_next());
   if (__next_bkt != __bkt)
     _M_buckets[__next_bkt] = __prev_n;
 }

      __prev_n->_M_nxt = __n->_M_nxt;
      iterator __result(__n->_M_next());
      this->_M_deallocate_node(__n);
      --_M_element_count;

      return __result;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_erase(true_type , const key_type& __k)
    -> size_type
    {
      __hash_code __code = this->_M_hash_code(__k);
      std::size_t __bkt = _M_bucket_index(__code);


      __node_base_ptr __prev_n = _M_find_before_node(__bkt, __k, __code);
      if (!__prev_n)
 return 0;


      __node_ptr __n = static_cast<__node_ptr>(__prev_n->_M_nxt);
      _M_erase(__bkt, __prev_n, __n);
      return 1;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_erase(false_type , const key_type& __k)
    -> size_type
    {
      __hash_code __code = this->_M_hash_code(__k);
      std::size_t __bkt = _M_bucket_index(__code);


      __node_base_ptr __prev_n = _M_find_before_node(__bkt, __k, __code);
      if (!__prev_n)
 return 0;







      __node_ptr __n = static_cast<__node_ptr>(__prev_n->_M_nxt);
      __node_ptr __n_last = __n->_M_next();
      while (__n_last && this->_M_node_equals(*__n, *__n_last))
 __n_last = __n_last->_M_next();

      std::size_t __n_last_bkt = __n_last ? _M_bucket_index(*__n_last) : __bkt;


      size_type __result = 0;
      do
 {
   __node_ptr __p = __n->_M_next();
   this->_M_deallocate_node(__n);
   __n = __p;
   ++__result;
 }
      while (__n != __n_last);

      _M_element_count -= __result;
      if (__prev_n == _M_buckets[__bkt])
 _M_remove_bucket_begin(__bkt, __n_last, __n_last_bkt);
      else if (__n_last_bkt != __bkt)
 _M_buckets[__n_last_bkt] = __prev_n;
      __prev_n->_M_nxt = __n_last;
      return __result;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    auto
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    erase(const_iterator __first, const_iterator __last)
    -> iterator
    {
      __node_ptr __n = __first._M_cur;
      __node_ptr __last_n = __last._M_cur;
      if (__n == __last_n)
 return iterator(__n);

      std::size_t __bkt = _M_bucket_index(*__n);

      __node_base_ptr __prev_n = _M_get_previous_node(__bkt, __n);
      bool __is_bucket_begin = __n == _M_bucket_begin(__bkt);
      std::size_t __n_bkt = __bkt;
      for (;;)
 {
   do
     {
       __node_ptr __tmp = __n;
       __n = __n->_M_next();
       this->_M_deallocate_node(__tmp);
       --_M_element_count;
       if (!__n)
  break;
       __n_bkt = _M_bucket_index(*__n);
     }
   while (__n != __last_n && __n_bkt == __bkt);
   if (__is_bucket_begin)
     _M_remove_bucket_begin(__bkt, __n, __n_bkt);
   if (__n == __last_n)
     break;
   __is_bucket_begin = true;
   __bkt = __n_bkt;
 }

      if (__n && (__n_bkt != __bkt || __is_bucket_begin))
 _M_buckets[__n_bkt] = __prev_n;
      __prev_n->_M_nxt = __n;
      return iterator(__n);
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    clear() noexcept
    {
      this->_M_deallocate_nodes(_M_begin());
      __builtin_memset(_M_buckets, 0,
         _M_bucket_count * sizeof(__node_base_ptr));
      _M_element_count = 0;
      _M_before_begin._M_nxt = nullptr;
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    rehash(size_type __bkt_count)
    {
      const __rehash_state& __saved_state = _M_rehash_policy._M_state();
      __bkt_count
 = std::max(_M_rehash_policy._M_bkt_for_elements(_M_element_count + 1),
     __bkt_count);
      __bkt_count = _M_rehash_policy._M_next_bkt(__bkt_count);

      if (__bkt_count != _M_bucket_count)
 _M_rehash(__bkt_count, __saved_state);
      else


 _M_rehash_policy._M_reset(__saved_state);
    }

  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_rehash(size_type __bkt_count, const __rehash_state& __state)
    {
      try
 {
   _M_rehash_aux(__bkt_count, __unique_keys{});
 }
      catch(...)
 {


   _M_rehash_policy._M_reset(__state);
   throw;
 }
    }


  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_rehash_aux(size_type __bkt_count, true_type )
    {
      __buckets_ptr __new_buckets = _M_allocate_buckets(__bkt_count);
      __node_ptr __p = _M_begin();
      _M_before_begin._M_nxt = nullptr;
      std::size_t __bbegin_bkt = 0;
      while (__p)
 {
   __node_ptr __next = __p->_M_next();
   std::size_t __bkt
     = __hash_code_base::_M_bucket_index(*__p, __bkt_count);
   if (!__new_buckets[__bkt])
     {
       __p->_M_nxt = _M_before_begin._M_nxt;
       _M_before_begin._M_nxt = __p;
       __new_buckets[__bkt] = &_M_before_begin;
       if (__p->_M_nxt)
  __new_buckets[__bbegin_bkt] = __p;
       __bbegin_bkt = __bkt;
     }
   else
     {
       __p->_M_nxt = __new_buckets[__bkt]->_M_nxt;
       __new_buckets[__bkt]->_M_nxt = __p;
     }

   __p = __next;
 }

      _M_deallocate_buckets();
      _M_bucket_count = __bkt_count;
      _M_buckets = __new_buckets;
    }



  template<typename _Key, typename _Value, typename _Alloc,
    typename _ExtractKey, typename _Equal,
    typename _Hash, typename _RangeHash, typename _Unused,
    typename _RehashPolicy, typename _Traits>
    void
    _Hashtable<_Key, _Value, _Alloc, _ExtractKey, _Equal,
        _Hash, _RangeHash, _Unused, _RehashPolicy, _Traits>::
    _M_rehash_aux(size_type __bkt_count, false_type )
    {
      __buckets_ptr __new_buckets = _M_allocate_buckets(__bkt_count);
      __node_ptr __p = _M_begin();
      _M_before_begin._M_nxt = nullptr;
      std::size_t __bbegin_bkt = 0;
      std::size_t __prev_bkt = 0;
      __node_ptr __prev_p = nullptr;
      bool __check_bucket = false;

      while (__p)
 {
   __node_ptr __next = __p->_M_next();
   std::size_t __bkt
     = __hash_code_base::_M_bucket_index(*__p, __bkt_count);

   if (__prev_p && __prev_bkt == __bkt)
     {



       __p->_M_nxt = __prev_p->_M_nxt;
       __prev_p->_M_nxt = __p;






       __check_bucket = true;
     }
   else
     {
       if (__check_bucket)
  {


    if (__prev_p->_M_nxt)
      {
        std::size_t __next_bkt
   = __hash_code_base::_M_bucket_index(
     *__prev_p->_M_next(), __bkt_count);
        if (__next_bkt != __prev_bkt)
   __new_buckets[__next_bkt] = __prev_p;
      }
    __check_bucket = false;
  }

       if (!__new_buckets[__bkt])
  {
    __p->_M_nxt = _M_before_begin._M_nxt;
    _M_before_begin._M_nxt = __p;
    __new_buckets[__bkt] = &_M_before_begin;
    if (__p->_M_nxt)
      __new_buckets[__bbegin_bkt] = __p;
    __bbegin_bkt = __bkt;
  }
       else
  {
    __p->_M_nxt = __new_buckets[__bkt]->_M_nxt;
    __new_buckets[__bkt]->_M_nxt = __p;
  }
     }
   __prev_p = __p;
   __prev_bkt = __bkt;
   __p = __next;
 }

      if (__check_bucket && __prev_p->_M_nxt)
 {
   std::size_t __next_bkt
     = __hash_code_base::_M_bucket_index(*__prev_p->_M_next(),
      __bkt_count);
   if (__next_bkt != __prev_bkt)
     __new_buckets[__next_bkt] = __prev_p;
 }

      _M_deallocate_buckets();
      _M_bucket_count = __bkt_count;
      _M_buckets = __new_buckets;
    }
# 2518 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/hashtable.h" 3
}
# 47 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 1 3
# 33 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{




  template<bool _Cache>
    using __umap_traits = __detail::_Hashtable_traits<_Cache, false, true>;

  template<typename _Key,
    typename _Tp,
    typename _Hash = hash<_Key>,
    typename _Pred = std::equal_to<_Key>,
    typename _Alloc = std::allocator<std::pair<const _Key, _Tp> >,
    typename _Tr = __umap_traits<__cache_default<_Key, _Hash>::value>>
    using __umap_hashtable = _Hashtable<_Key, std::pair<const _Key, _Tp>,
                                        _Alloc, __detail::_Select1st,
            _Pred, _Hash,
            __detail::_Mod_range_hashing,
            __detail::_Default_ranged_hash,
            __detail::_Prime_rehash_policy, _Tr>;


  template<bool _Cache>
    using __ummap_traits = __detail::_Hashtable_traits<_Cache, false, false>;

  template<typename _Key,
    typename _Tp,
    typename _Hash = hash<_Key>,
    typename _Pred = std::equal_to<_Key>,
    typename _Alloc = std::allocator<std::pair<const _Key, _Tp> >,
    typename _Tr = __ummap_traits<__cache_default<_Key, _Hash>::value>>
    using __ummap_hashtable = _Hashtable<_Key, std::pair<const _Key, _Tp>,
      _Alloc, __detail::_Select1st,
      _Pred, _Hash,
      __detail::_Mod_range_hashing,
      __detail::_Default_ranged_hash,
      __detail::_Prime_rehash_policy, _Tr>;

  template<class _Key, class _Tp, class _Hash, class _Pred, class _Alloc>
    class unordered_multimap;
# 98 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
  template<typename _Key, typename _Tp,
    typename _Hash = hash<_Key>,
    typename _Pred = equal_to<_Key>,
    typename _Alloc = allocator<std::pair<const _Key, _Tp>>>
    class unordered_map
    {
      typedef __umap_hashtable<_Key, _Tp, _Hash, _Pred, _Alloc> _Hashtable;
      _Hashtable _M_h;

    public:



      typedef typename _Hashtable::key_type key_type;
      typedef typename _Hashtable::value_type value_type;
      typedef typename _Hashtable::mapped_type mapped_type;
      typedef typename _Hashtable::hasher hasher;
      typedef typename _Hashtable::key_equal key_equal;
      typedef typename _Hashtable::allocator_type allocator_type;




      typedef typename _Hashtable::pointer pointer;
      typedef typename _Hashtable::const_pointer const_pointer;
      typedef typename _Hashtable::reference reference;
      typedef typename _Hashtable::const_reference const_reference;
      typedef typename _Hashtable::iterator iterator;
      typedef typename _Hashtable::const_iterator const_iterator;
      typedef typename _Hashtable::local_iterator local_iterator;
      typedef typename _Hashtable::const_local_iterator const_local_iterator;
      typedef typename _Hashtable::size_type size_type;
      typedef typename _Hashtable::difference_type difference_type;
# 141 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      unordered_map() = default;
# 150 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      explicit
      unordered_map(size_type __n,
      const hasher& __hf = hasher(),
      const key_equal& __eql = key_equal(),
      const allocator_type& __a = allocator_type())
      : _M_h(__n, __hf, __eql, __a)
      { }
# 171 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      template<typename _InputIterator>
 unordered_map(_InputIterator __first, _InputIterator __last,
        size_type __n = 0,
        const hasher& __hf = hasher(),
        const key_equal& __eql = key_equal(),
        const allocator_type& __a = allocator_type())
 : _M_h(__first, __last, __n, __hf, __eql, __a)
 { }


      unordered_map(const unordered_map&) = default;


      unordered_map(unordered_map&&) = default;





      explicit
      unordered_map(const allocator_type& __a)
 : _M_h(__a)
      { }






      unordered_map(const unordered_map& __umap,
      const allocator_type& __a)
      : _M_h(__umap._M_h, __a)
      { }






      unordered_map(unordered_map&& __umap,
      const allocator_type& __a)
 noexcept( noexcept(_Hashtable(std::move(__umap._M_h), __a)) )
      : _M_h(std::move(__umap._M_h), __a)
      { }
# 227 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      unordered_map(initializer_list<value_type> __l,
      size_type __n = 0,
      const hasher& __hf = hasher(),
      const key_equal& __eql = key_equal(),
      const allocator_type& __a = allocator_type())
      : _M_h(__l, __n, __hf, __eql, __a)
      { }

      unordered_map(size_type __n, const allocator_type& __a)
      : unordered_map(__n, hasher(), key_equal(), __a)
      { }

      unordered_map(size_type __n, const hasher& __hf,
      const allocator_type& __a)
      : unordered_map(__n, __hf, key_equal(), __a)
      { }

      template<typename _InputIterator>
 unordered_map(_InputIterator __first, _InputIterator __last,
        size_type __n,
        const allocator_type& __a)
 : unordered_map(__first, __last, __n, hasher(), key_equal(), __a)
 { }

      template<typename _InputIterator>
 unordered_map(_InputIterator __first, _InputIterator __last,
        size_type __n, const hasher& __hf,
        const allocator_type& __a)
   : unordered_map(__first, __last, __n, __hf, key_equal(), __a)
 { }

      unordered_map(initializer_list<value_type> __l,
      size_type __n,
      const allocator_type& __a)
      : unordered_map(__l, __n, hasher(), key_equal(), __a)
      { }

      unordered_map(initializer_list<value_type> __l,
      size_type __n, const hasher& __hf,
      const allocator_type& __a)
      : unordered_map(__l, __n, __hf, key_equal(), __a)
      { }


      unordered_map&
      operator=(const unordered_map&) = default;


      unordered_map&
      operator=(unordered_map&&) = default;
# 289 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      unordered_map&
      operator=(initializer_list<value_type> __l)
      {
 _M_h = __l;
 return *this;
      }


      allocator_type
      get_allocator() const noexcept
      { return _M_h.get_allocator(); }




                         bool
      empty() const noexcept
      { return _M_h.empty(); }


      size_type
      size() const noexcept
      { return _M_h.size(); }


      size_type
      max_size() const noexcept
      { return _M_h.max_size(); }







      iterator
      begin() noexcept
      { return _M_h.begin(); }






      const_iterator
      begin() const noexcept
      { return _M_h.begin(); }

      const_iterator
      cbegin() const noexcept
      { return _M_h.begin(); }






      iterator
      end() noexcept
      { return _M_h.end(); }






      const_iterator
      end() const noexcept
      { return _M_h.end(); }

      const_iterator
      cend() const noexcept
      { return _M_h.end(); }
# 386 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      template<typename... _Args>
 std::pair<iterator, bool>
 emplace(_Args&&... __args)
 { return _M_h.emplace(std::forward<_Args>(__args)...); }
# 417 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      template<typename... _Args>
 iterator
 emplace_hint(const_iterator __pos, _Args&&... __args)
 { return _M_h.emplace_hint(__pos, std::forward<_Args>(__args)...); }
# 550 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      std::pair<iterator, bool>
      insert(const value_type& __x)
      { return _M_h.insert(__x); }



      std::pair<iterator, bool>
      insert(value_type&& __x)
      { return _M_h.insert(std::move(__x)); }

      template<typename _Pair>
 __enable_if_t<is_constructible<value_type, _Pair&&>::value,
        pair<iterator, bool>>
 insert(_Pair&& __x)
        { return _M_h.emplace(std::forward<_Pair>(__x)); }
# 589 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      insert(const_iterator __hint, const value_type& __x)
      { return _M_h.insert(__hint, __x); }



      iterator
      insert(const_iterator __hint, value_type&& __x)
      { return _M_h.insert(__hint, std::move(__x)); }

      template<typename _Pair>
 __enable_if_t<is_constructible<value_type, _Pair&&>::value, iterator>
 insert(const_iterator __hint, _Pair&& __x)
 { return _M_h.emplace_hint(__hint, std::forward<_Pair>(__x)); }
# 614 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      template<typename _InputIterator>
 void
 insert(_InputIterator __first, _InputIterator __last)
 { _M_h.insert(__first, __last); }
# 626 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      void
      insert(initializer_list<value_type> __l)
      { _M_h.insert(__l); }
# 739 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      erase(const_iterator __position)
      { return _M_h.erase(__position); }


      iterator
      erase(iterator __position)
      { return _M_h.erase(__position); }
# 761 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      size_type
      erase(const key_type& __x)
      { return _M_h.erase(__x); }
# 779 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      erase(const_iterator __first, const_iterator __last)
      { return _M_h.erase(__first, __last); }







      void
      clear() noexcept
      { _M_h.clear(); }
# 803 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      void
      swap(unordered_map& __x)
      noexcept( noexcept(_M_h.swap(__x._M_h)) )
      { _M_h.swap(__x._M_h); }
# 843 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      hasher
      hash_function() const
      { return _M_h.hash_function(); }



      key_equal
      key_eq() const
      { return _M_h.key_eq(); }
# 867 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      find(const key_type& __x)
      { return _M_h.find(__x); }
# 878 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      const_iterator
      find(const key_type& __x) const
      { return _M_h.find(__x); }
# 900 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      size_type
      count(const key_type& __x) const
      { return _M_h.count(__x); }
# 940 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      std::pair<iterator, iterator>
      equal_range(const key_type& __x)
      { return _M_h.equal_range(__x); }
# 952 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      std::pair<const_iterator, const_iterator>
      equal_range(const key_type& __x) const
      { return _M_h.equal_range(__x); }
# 978 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      mapped_type&
      operator[](const key_type& __k)
      { return _M_h[__k]; }

      mapped_type&
      operator[](key_type&& __k)
      { return _M_h[std::move(__k)]; }
# 995 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      mapped_type&
      at(const key_type& __k)
      { return _M_h.at(__k); }

      const mapped_type&
      at(const key_type& __k) const
      { return _M_h.at(__k); }





      size_type
      bucket_count() const noexcept
      { return _M_h.bucket_count(); }


      size_type
      max_bucket_count() const noexcept
      { return _M_h.max_bucket_count(); }






      size_type
      bucket_size(size_type __n) const
      { return _M_h.bucket_size(__n); }






      size_type
      bucket(const key_type& __key) const
      { return _M_h.bucket(__key); }







      local_iterator
      begin(size_type __n)
      { return _M_h.begin(__n); }
# 1051 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      const_local_iterator
      begin(size_type __n) const
      { return _M_h.begin(__n); }

      const_local_iterator
      cbegin(size_type __n) const
      { return _M_h.cbegin(__n); }
# 1066 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      local_iterator
      end(size_type __n)
      { return _M_h.end(__n); }
# 1077 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      const_local_iterator
      end(size_type __n) const
      { return _M_h.end(__n); }

      const_local_iterator
      cend(size_type __n) const
      { return _M_h.cend(__n); }





      float
      load_factor() const noexcept
      { return _M_h.load_factor(); }



      float
      max_load_factor() const noexcept
      { return _M_h.max_load_factor(); }





      void
      max_load_factor(float __z)
      { _M_h.max_load_factor(__z); }
# 1114 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      void
      rehash(size_type __n)
      { _M_h.rehash(__n); }
# 1125 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      void
      reserve(size_type __n)
      { _M_h.reserve(__n); }

      template<typename _Key1, typename _Tp1, typename _Hash1, typename _Pred1,
        typename _Alloc1>
        friend bool
 operator==(const unordered_map<_Key1, _Tp1, _Hash1, _Pred1, _Alloc1>&,
     const unordered_map<_Key1, _Tp1, _Hash1, _Pred1, _Alloc1>&);
    };
# 1241 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
  template<typename _Key, typename _Tp,
    typename _Hash = hash<_Key>,
    typename _Pred = equal_to<_Key>,
    typename _Alloc = allocator<std::pair<const _Key, _Tp>>>
    class unordered_multimap
    {
      typedef __ummap_hashtable<_Key, _Tp, _Hash, _Pred, _Alloc> _Hashtable;
      _Hashtable _M_h;

    public:



      typedef typename _Hashtable::key_type key_type;
      typedef typename _Hashtable::value_type value_type;
      typedef typename _Hashtable::mapped_type mapped_type;
      typedef typename _Hashtable::hasher hasher;
      typedef typename _Hashtable::key_equal key_equal;
      typedef typename _Hashtable::allocator_type allocator_type;




      typedef typename _Hashtable::pointer pointer;
      typedef typename _Hashtable::const_pointer const_pointer;
      typedef typename _Hashtable::reference reference;
      typedef typename _Hashtable::const_reference const_reference;
      typedef typename _Hashtable::iterator iterator;
      typedef typename _Hashtable::const_iterator const_iterator;
      typedef typename _Hashtable::local_iterator local_iterator;
      typedef typename _Hashtable::const_local_iterator const_local_iterator;
      typedef typename _Hashtable::size_type size_type;
      typedef typename _Hashtable::difference_type difference_type;
# 1283 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      unordered_multimap() = default;
# 1292 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      explicit
      unordered_multimap(size_type __n,
    const hasher& __hf = hasher(),
    const key_equal& __eql = key_equal(),
    const allocator_type& __a = allocator_type())
      : _M_h(__n, __hf, __eql, __a)
      { }
# 1313 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      template<typename _InputIterator>
 unordered_multimap(_InputIterator __first, _InputIterator __last,
      size_type __n = 0,
      const hasher& __hf = hasher(),
      const key_equal& __eql = key_equal(),
      const allocator_type& __a = allocator_type())
 : _M_h(__first, __last, __n, __hf, __eql, __a)
 { }


      unordered_multimap(const unordered_multimap&) = default;


      unordered_multimap(unordered_multimap&&) = default;





      explicit
      unordered_multimap(const allocator_type& __a)
      : _M_h(__a)
      { }






      unordered_multimap(const unordered_multimap& __ummap,
    const allocator_type& __a)
      : _M_h(__ummap._M_h, __a)
      { }






      unordered_multimap(unordered_multimap&& __ummap,
    const allocator_type& __a)
 noexcept( noexcept(_Hashtable(std::move(__ummap._M_h), __a)) )
      : _M_h(std::move(__ummap._M_h), __a)
      { }
# 1369 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      unordered_multimap(initializer_list<value_type> __l,
    size_type __n = 0,
    const hasher& __hf = hasher(),
    const key_equal& __eql = key_equal(),
    const allocator_type& __a = allocator_type())
      : _M_h(__l, __n, __hf, __eql, __a)
      { }

      unordered_multimap(size_type __n, const allocator_type& __a)
      : unordered_multimap(__n, hasher(), key_equal(), __a)
      { }

      unordered_multimap(size_type __n, const hasher& __hf,
    const allocator_type& __a)
      : unordered_multimap(__n, __hf, key_equal(), __a)
      { }

      template<typename _InputIterator>
 unordered_multimap(_InputIterator __first, _InputIterator __last,
      size_type __n,
      const allocator_type& __a)
 : unordered_multimap(__first, __last, __n, hasher(), key_equal(), __a)
 { }

      template<typename _InputIterator>
 unordered_multimap(_InputIterator __first, _InputIterator __last,
      size_type __n, const hasher& __hf,
      const allocator_type& __a)
 : unordered_multimap(__first, __last, __n, __hf, key_equal(), __a)
 { }

      unordered_multimap(initializer_list<value_type> __l,
    size_type __n,
    const allocator_type& __a)
      : unordered_multimap(__l, __n, hasher(), key_equal(), __a)
      { }

      unordered_multimap(initializer_list<value_type> __l,
    size_type __n, const hasher& __hf,
    const allocator_type& __a)
      : unordered_multimap(__l, __n, __hf, key_equal(), __a)
      { }


      unordered_multimap&
      operator=(const unordered_multimap&) = default;


      unordered_multimap&
      operator=(unordered_multimap&&) = default;
# 1431 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      unordered_multimap&
      operator=(initializer_list<value_type> __l)
      {
 _M_h = __l;
 return *this;
      }


      allocator_type
      get_allocator() const noexcept
      { return _M_h.get_allocator(); }




                         bool
      empty() const noexcept
      { return _M_h.empty(); }


      size_type
      size() const noexcept
      { return _M_h.size(); }


      size_type
      max_size() const noexcept
      { return _M_h.max_size(); }







      iterator
      begin() noexcept
      { return _M_h.begin(); }






      const_iterator
      begin() const noexcept
      { return _M_h.begin(); }

      const_iterator
      cbegin() const noexcept
      { return _M_h.begin(); }






      iterator
      end() noexcept
      { return _M_h.end(); }






      const_iterator
      end() const noexcept
      { return _M_h.end(); }

      const_iterator
      cend() const noexcept
      { return _M_h.end(); }
# 1523 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      template<typename... _Args>
 iterator
 emplace(_Args&&... __args)
 { return _M_h.emplace(std::forward<_Args>(__args)...); }
# 1550 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      template<typename... _Args>
 iterator
 emplace_hint(const_iterator __pos, _Args&&... __args)
 { return _M_h.emplace_hint(__pos, std::forward<_Args>(__args)...); }
# 1565 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      insert(const value_type& __x)
      { return _M_h.insert(__x); }

      iterator
      insert(value_type&& __x)
      { return _M_h.insert(std::move(__x)); }

      template<typename _Pair>
 __enable_if_t<is_constructible<value_type, _Pair&&>::value, iterator>
 insert(_Pair&& __x)
        { return _M_h.emplace(std::forward<_Pair>(__x)); }
# 1599 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      insert(const_iterator __hint, const value_type& __x)
      { return _M_h.insert(__hint, __x); }



      iterator
      insert(const_iterator __hint, value_type&& __x)
      { return _M_h.insert(__hint, std::move(__x)); }

      template<typename _Pair>
 __enable_if_t<is_constructible<value_type, _Pair&&>::value, iterator>
 insert(const_iterator __hint, _Pair&& __x)
        { return _M_h.emplace_hint(__hint, std::forward<_Pair>(__x)); }
# 1624 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      template<typename _InputIterator>
 void
 insert(_InputIterator __first, _InputIterator __last)
 { _M_h.insert(__first, __last); }
# 1637 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      void
      insert(initializer_list<value_type> __l)
      { _M_h.insert(__l); }
# 1680 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      erase(const_iterator __position)
      { return _M_h.erase(__position); }


      iterator
      erase(iterator __position)
      { return _M_h.erase(__position); }
# 1701 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      size_type
      erase(const key_type& __x)
      { return _M_h.erase(__x); }
# 1720 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      erase(const_iterator __first, const_iterator __last)
      { return _M_h.erase(__first, __last); }







      void
      clear() noexcept
      { _M_h.clear(); }
# 1744 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      void
      swap(unordered_multimap& __x)
      noexcept( noexcept(_M_h.swap(__x._M_h)) )
      { _M_h.swap(__x._M_h); }
# 1786 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      hasher
      hash_function() const
      { return _M_h.hash_function(); }



      key_equal
      key_eq() const
      { return _M_h.key_eq(); }
# 1810 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      iterator
      find(const key_type& __x)
      { return _M_h.find(__x); }
# 1821 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      const_iterator
      find(const key_type& __x) const
      { return _M_h.find(__x); }
# 1839 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      size_type
      count(const key_type& __x) const
      { return _M_h.count(__x); }
# 1877 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      std::pair<iterator, iterator>
      equal_range(const key_type& __x)
      { return _M_h.equal_range(__x); }
# 1889 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      std::pair<const_iterator, const_iterator>
      equal_range(const key_type& __x) const
      { return _M_h.equal_range(__x); }
# 1905 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      size_type
      bucket_count() const noexcept
      { return _M_h.bucket_count(); }


      size_type
      max_bucket_count() const noexcept
      { return _M_h.max_bucket_count(); }






      size_type
      bucket_size(size_type __n) const
      { return _M_h.bucket_size(__n); }






      size_type
      bucket(const key_type& __key) const
      { return _M_h.bucket(__key); }







      local_iterator
      begin(size_type __n)
      { return _M_h.begin(__n); }
# 1949 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      const_local_iterator
      begin(size_type __n) const
      { return _M_h.begin(__n); }

      const_local_iterator
      cbegin(size_type __n) const
      { return _M_h.cbegin(__n); }
# 1964 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      local_iterator
      end(size_type __n)
      { return _M_h.end(__n); }
# 1975 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      const_local_iterator
      end(size_type __n) const
      { return _M_h.end(__n); }

      const_local_iterator
      cend(size_type __n) const
      { return _M_h.cend(__n); }





      float
      load_factor() const noexcept
      { return _M_h.load_factor(); }



      float
      max_load_factor() const noexcept
      { return _M_h.max_load_factor(); }





      void
      max_load_factor(float __z)
      { _M_h.max_load_factor(__z); }
# 2012 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      void
      rehash(size_type __n)
      { _M_h.rehash(__n); }
# 2023 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
      void
      reserve(size_type __n)
      { _M_h.reserve(__n); }

      template<typename _Key1, typename _Tp1, typename _Hash1, typename _Pred1,
        typename _Alloc1>
        friend bool
 operator==(const unordered_multimap<_Key1, _Tp1,
         _Hash1, _Pred1, _Alloc1>&,
     const unordered_multimap<_Key1, _Tp1,
         _Hash1, _Pred1, _Alloc1>&);
    };
# 2118 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
  template<class _Key, class _Tp, class _Hash, class _Pred, class _Alloc>
    inline void
    swap(unordered_map<_Key, _Tp, _Hash, _Pred, _Alloc>& __x,
  unordered_map<_Key, _Tp, _Hash, _Pred, _Alloc>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }

  template<class _Key, class _Tp, class _Hash, class _Pred, class _Alloc>
    inline void
    swap(unordered_multimap<_Key, _Tp, _Hash, _Pred, _Alloc>& __x,
  unordered_multimap<_Key, _Tp, _Hash, _Pred, _Alloc>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }

  template<class _Key, class _Tp, class _Hash, class _Pred, class _Alloc>
    inline bool
    operator==(const unordered_map<_Key, _Tp, _Hash, _Pred, _Alloc>& __x,
        const unordered_map<_Key, _Tp, _Hash, _Pred, _Alloc>& __y)
    { return __x._M_h._M_equal(__y._M_h); }


  template<class _Key, class _Tp, class _Hash, class _Pred, class _Alloc>
    inline bool
    operator!=(const unordered_map<_Key, _Tp, _Hash, _Pred, _Alloc>& __x,
        const unordered_map<_Key, _Tp, _Hash, _Pred, _Alloc>& __y)
    { return !(__x == __y); }


  template<class _Key, class _Tp, class _Hash, class _Pred, class _Alloc>
    inline bool
    operator==(const unordered_multimap<_Key, _Tp, _Hash, _Pred, _Alloc>& __x,
        const unordered_multimap<_Key, _Tp, _Hash, _Pred, _Alloc>& __y)
    { return __x._M_h._M_equal(__y._M_h); }


  template<class _Key, class _Tp, class _Hash, class _Pred, class _Alloc>
    inline bool
    operator!=(const unordered_multimap<_Key, _Tp, _Hash, _Pred, _Alloc>& __x,
        const unordered_multimap<_Key, _Tp, _Hash, _Pred, _Alloc>& __y)
    { return !(__x == __y); }
# 2213 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unordered_map.h" 3
}
# 48 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3

# 1 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/erase_if.h" 1 3
# 34 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/erase_if.h" 3
# 50 "/usr/bin/../lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/unordered_map" 2 3
# 22 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.h" 2

# 1 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/procevents.h" 1
# 21 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/procevents.h"
namespace rtengine
{


enum ProcEventCode {
    EvPhotoLoaded = 0,
    EvProfileLoaded = 1,
    EvProfileChanged = 2,
    EvHistoryBrowsed = 3,
    EvBrightness = 4,
    EvContrast = 5,
    EvBlack = 6,
    EvExpComp = 7,
    EvHLCompr = 8,
    EvSHCompr = 9,
    EvToneCurve1 = 10,
    EvAutoExp = 11,
    EvClip = 12,
    EvLBrightness = 13,
    EvLContrast = 14,
    EvLBlack = 15,
    EvLHLCompr = 16,
    EvLSHCompr = 17,
    EvLLCurve = 18,
    EvShrEnabled = 19,
    EvShrRadius = 20,
    EvShrAmount = 21,
    EvShrThresh = 22,
    EvShrEdgeOnly = 23,
    EvShrEdgeRadius = 24,
    EvShrEdgeTolerance = 25,
    EvShrHaloControl = 26,
    EvShrHaloAmount = 27,
    EvShrMethod = 28,
    EvShrDRadius = 29,
    EvShrDAmount = 30,
    EvShrDDamping = 31,
    EvShrDIterations = 32,
    EvLCPUseDist = 33,
    EvLCPUseVign = 34,
    EvLCPUseCA = 35,
    EvFixedExp = 36,
    EvWBMethod = 37,
    EvWBTemp = 38,
    EvWBGreen = 39,
    EvToneCurveMode1 = 40,
    EvToneCurve2 = 41,
    EvToneCurveMode2 = 42,
    obsolete_43 = 43,
    obsolete_44 = 44,
    obsolete_45 = 45,
    obsolete_46 = 46,
    EvDCPToneCurve = 47,
    EvDCPIlluminant = 48,
    EvSHEnabled = 49,
    EvSHHighlights = 50,
    EvSHShadows = 51,
    EvSHHLTonalW = 52,
    EvSHSHTonalW = 53,
    EvSHLContrast = 54,
    EvSHRadius = 55,
    EvCTRotate = 56,
    EvCTHFlip = 57,
    EvCTVFlip = 58,
    EvROTDegree = 59,
    EvTransAutoFill = 60,
    EvDISTAmount = 61,
    EvBookmarkSelected = 62,
    EvCrop = 63,
    EvCACorr = 64,
    EvHREnabled = 65,
    obsolete_66 = 66,
    EvHRMethod = 67,
    EvWProfile = 68,
    EvOProfile = 69,
    EvIProfile = 70,
    EvVignettingAmount = 71,
    EvChMixer = 72,
    EvResizeScale = 73,
    EvResizeMethod = 74,
    EvExif = 75,
    EvIPTC = 76,
    EvResizeSpec = 77,
    EvResizeWidth = 78,
    EvResizeHeight = 79,
    EvResizeEnabled = 80,
    EvProfileChangeNotification = 81,
    EvSHHighQuality = 82,
    EvPerspCorr = 83,
    EvLCPFile = 84,
    EvRGBrCurveLumamode = 85,
    EvIDNEnabled = 86,
    EvIDNThresh = 87,
    EvDPDNEnabled = 88,
    EvDPDNLuma = 89,
    EvDPDNChroma = 90,
    EvDPDNGamma = 91,
    EvDirPyrEqualizer = 92,
    EvDirPyrEqlEnabled = 93,
    EvLSaturation = 94,
    EvLaCurve = 95,
    EvLbCurve = 96,
    EvDemosaicMethod = 97,
    EvPreProcessHotPixel = 98,
    EvSaturation = 99,
    EvHSVEqualizerH = 100,
    EvHSVEqualizerS = 101,
    EvHSVEqualizerV = 102,
    EvHSVEqEnabled = 103,
    EvDefringeEnabled = 104,
    EvDefringeRadius = 105,
    EvDefringeThreshold = 106,
    EvHLComprThreshold = 107,
    EvResizeBoundingBox = 108,
    EvResizeAppliesTo = 109,
    EvLAvoidColorShift = 110,
    obsolete_111 = 111,
    EvLRSTProtection = 112,
    EvDemosaicDCBIter = 113,
    EvDemosaicFalseColorIter = 114,
    EvDemosaicDCBEnhanced = 115,
    EvPreProcessCARed = 116,
    EvPreProcessCABlue = 117,
    EvPreProcessLineDenoise = 118,
    EvPreProcessGEquilThresh = 119,
    EvPreProcessAutoCA = 120,
    EvPreProcessAutoDF = 121,
    EvPreProcessDFFile = 122,
    EvPreProcessExpCorrLinear = 123,
    obsolete_124 = 124,
    EvFlatFieldFile = 125,
    EvFlatFieldAutoSelect = 126,
    EvFlatFieldBlurRadius = 127,
    EvFlatFieldBlurType = 128,
    EvAutoDIST = 129,
    EvDPDNLumCurve = 130,
    EvDPDNChromCurve = 131,
    EvGAMMA = 132,
    EvGAMPOS = 133,
    EvGAMFREE = 134,
    EvSLPOS = 135,
    EvPreProcessExpBlackzero = 136,
    EvPreProcessExpBlackone = 137,
    EvPreProcessExpBlacktwo = 138,
    EvPreProcessExpBlackthree = 139,
    EvPreProcessExptwoGreen = 140,
    EvSharpenEdgePasses = 141,
    EvSharpenEdgeAmount = 142,
    EvSharpenMicroAmount = 143,
    EvSharpenMicroUniformity = 144,
    EvSharpenEdgeEnabled = 145,
    EvSharpenEdgeThreechannels = 146,
    EvSharpenMicroEnabled = 147,
    EvSharpenMicroMatrix = 148,
    EvDemosaicALLEnhanced = 149,
    EvVibranceEnabled = 150,
    EvVibrancePastels = 151,
    EvVibranceSaturated = 152,
    EvVibranceProtectSkins = 153,
    EvVibranceAvoidColorShift = 154,
    EvVibrancePastSatTog = 155,
    EvVibrancePastSatThreshold = 156,
    EvEPDStrength = 157,
    EvEPDEdgeStopping = 158,
    EvEPDScale = 159,
    EvEPDReweightingIterates = 160,
    EvEPDEnabled = 161,
    EvRGBrCurve = 162,
    EvRGBgCurve = 163,
    EvRGBbCurve = 164,
    EvNeutralExp = 165,
    EvDemosaicMethodPreProc = 166,
    EvLCCCurve = 167,
    EvLCHCurve = 168,
    EvVibranceSkinTonesCurve = 169,
    EvLLCCurve = 170,
    EvLLCredsk = 171,
    EvDPDNLdetail = 172,
    EvCATEnabled = 173,
    EvCATDegree = 174,
    EvCATMethodsur = 175,
    EvCATAdapscen = 176,
    EvCATAdapLum = 177,
    EvCATMethodWB = 178,
    EvCATJLight = 179,
    EvCATChroma = 180,
    EvCATAutoDegree = 181,
    EvCATContrast = 182,
    EvCATsurr = 183,
    EvCATgamut = 184,
    EvCATMethodalg = 185,
    EvCATRstpro = 186,
    EvCATQbright = 187,
    EvCATQContrast = 188,
    EvCATSChroma = 189,
    EvCATMChroma = 190,
    EvCAThue = 191,
    EvCATCurve1 = 192,
    EvCATCurve2 = 193,
    EvCATCurveMode1 = 194,
    EvCATCurveMode2 = 195,
    EvCATCurve3 = 196,
    EvCATCurveMode3 = 197,
    EvCATdatacie = 198,
    EvCATtonecie = 199,
    EvDPDNredchro = 200,
    EvDPDNbluechro = 201,
    EvDPDNmet = 202,
    EvDemosaicLMMSEIter = 203,
    EvCATbadpix = 204,
    EvCATAutoAdap = 205,
    EvPFCurve = 206,
    EvWBequal = 207,
    EvWBequalbo = 208,
    EvGradientDegree = 209,
    EvGradientEnabled = 210,
    EvPCVignetteStrength = 211,
    EvPCVignetteEnabled = 212,
    EvBWChmixEnabled = 213,
    EvBWred = 214,
    EvBWgreen = 215,
    EvBWblue = 216,
    EvBWredgam = 217,
    EvBWgreengam = 218,
    EvBWbluegam = 219,
    EvBWfilter = 220,
    EvBWsetting = 221,
    EvBWoran = 222,
    EvBWyell = 223,
    EvBWcyan = 224,
    EvBWmag = 225,
    EvBWpur = 226,
    EvBWLuminanceEqual = 227,
    EvBWChmixEnabledLm = 228,
    EvBWmethod = 229,
    EvBWBeforeCurve = 230,
    EvBWBeforeCurveMode = 231,
    EvBWAfterCurve = 232,
    EvBWAfterCurveMode = 233,
    EvAutoch = 234,

    EvNeutralBW = 236,
    EvGradientFeather = 237,
    EvGradientStrength = 238,
    EvGradientCenter = 239,
    EvPCVignetteFeather = 240,
    EvPCVignetteRoundness = 241,
    EvVignettingRadius = 242,
    EvVignettingStrenght = 243,
    EvVignettingCenter = 244,
    EvLCLCurve = 245,
    EvLLHCurve = 246,
    EvLHHCurve = 247,
    EvDirPyrEqualizerThreshold = 248,
    EvDPDNenhance = 249,
    EvBWMethodalg = 250,
    EvDirPyrEqualizerSkin = 251,
    EvDirPyrEqlgamutlab = 252,
    EvDirPyrEqualizerHueskin = 253,
    EvDPDNmedian = 254,
    EvDPDNmedmet = 255,
    EvColorToningEnabled = 256,
    EvColorToningColor = 257,
    EvColorToningOpacity = 258,
    EvColorToningCLCurve = 259,
    EvColorToningMethod = 260,
    EvColorToningLLCurve = 261,
    EvColorToningredlow = 262,
    EvColorToninggreenlow = 263,
    EvColorToningbluelow = 264,
    EvColorToningredmed = 265,
    EvColorToninggreenmed = 266,
    EvColorToningbluemed = 267,
    EvColorToningredhigh = 268,
    EvColorToninggreenhigh = 269,
    EvColorToningbluehigh = 270,
    EvColorToningbalance = 271,
    EvColorToningNeutral = 272,
    EvColorToningsatlow = 273,
    EvColorToningsathigh = 274,
    EvColorToningTwocolor = 275,
    EvColorToningNeutralcur = 276,
    EvColorToningLumamode = 277,
    EvColorToningShadows = 278,
    EvColorToningHighights = 279,
    EvColorToningSatProtection = 280,
    EvColorToningSatThreshold = 281,
    EvColorToningStrength = 282,
    EvColorToningautosat = 283,
    EvDPDNmetmed = 284,
    EvDPDNrgbmet = 285,
    EvDPDNpasses = 286,
    EvFlatFieldClipControl = 287,
    EvFlatFieldAutoClipControl = 288,
    EvPreProcessExpBlackRed = 289,
    EvPreProcessExpBlackGreen = 290,
    EvPreProcessExpBlackBlue = 291,
    EvFilmSimulationEnabled = 292,
    EvFilmSimulationStrength = 293,
    EvFilmSimulationFilename = 294,
    EvDPDNLCurve = 295,
    EvDPDNsmet = 296,
    EvPreProcessDeadPixel = 297,
    EvDPDNCCCurve = 298,
    EvDPDNautochroma = 299,
    EvDPDNLmet = 300,
    EvDPDNCmet = 301,
    EvDPDNC2met = 302,
    EvWavelet = 303,
    EvWavEnabled = 304,
    EvWavLmet = 305,
    EvWavCLmet = 306,
    EvWavDirmeto = 307,
    EvWavtiles = 308,
    EvWavsky = 309,
    EvWavthres = 310,
    EvWavthr = 311,
    EvWavchroma = 312,
    EvWavmedian = 313,
    EvWavunif = 314,
    EvWavSkin = 315,
    EvWavHueskin = 316,
    EvWavThreshold = 317,
    EvWavlhl = 318,
    EvWavlbl = 319,
    EvWavThreshold2 = 320,
    EvWavavoid = 321,
    EvWavCCCurve = 322,
    EvWavpast = 323,
    EvWavsat = 324,
    EvWavCHmet = 325,
    EvWavHSmet = 326,
    EvWavchro = 327,
    EvWavColor = 328,
    EvWavOpac = 329,
    EvWavsup = 330,
    EvWavTilesmet = 331,
    EvWavrescon = 332,
    EvWavreschro = 333,
    EvWavresconH = 334,
    EvWavthrH = 335,
    EvWavHueskin2 = 336,
    EvWavedgrad = 337,
    EvWavedgval = 338,
    EvWavStrength = 339,
    EvWavdaubcoeffmet = 340,
    EvWavedgreinf = 341,
    EvWaveletch = 342,
    EvWavCHSLmet = 343,
    EvWavedgcont = 344,
    EvWavEDmet = 345,
    EvWavlev0nois = 346,
    EvWavlev1nois = 347,
    EvWavlev2nois = 348,
    EvWavmedianlev = 349,
    EvWavHHCurve = 350,
    EvWavBackmet = 351,
    EvWavedgedetect = 352,
    EvWavlipst = 353,
    EvWavedgedetectthr = 354,
    EvWavedgedetectthr2 = 355,
    EvWavlinkedg = 356,
    EvWavCHCurve = 357,
    EvPreProcessHotDeadThresh = 358,
    EvEPDgamma = 359,
    EvWavtmr = 360,
    EvWavTMmet = 361,
    EvWavtmrs = 362,
    EvWavbalance = 363,
    EvWaviter = 364,
    EvWavgamma = 365,
    EvWavCLCurve = 366,
    EvWavopacity = 367,
    EvWavBAmet = 368,
    EvWavopacityWL = 369,
    EvPrShrEnabled = 370,
    EvPrShrRadius = 371,
    EvPrShrAmount = 372,
    EvPrShrThresh = 373,
    EvPrShrEdgeOnly = 374,
    EvPrShrEdgeRadius = 375,
    EvPrShrEdgeTolerance = 376,
    EvPrShrHaloControl = 377,
    EvPrShrHaloAmount = 378,
    EvPrShrMethod = 379,
    EvPrShrDRadius = 380,
    EvPrShrDAmount = 381,
    EvPrShrDDamping = 382,
    EvPrShrDIterations = 383,
    EvWavcbenab = 384,
    EvWavgreenhigh = 385,
    EvWavbluehigh = 386,
    EvWavgreenmed = 387,
    EvWavbluemed = 388,
    EvWavgreenlow = 389,
    EvWavbluelow = 390,
    EvWavNeutral = 391,
    EvDCPApplyLookTable = 392,
    EvDCPApplyBaselineExposureOffset = 393,
    EvDCPApplyHueSatMap = 394,
    EvWavenacont = 395,
    EvWavenachrom = 396,
    EvWavenaedge = 397,
    EvWavenares = 398,
    EvWavenafin = 399,
    EvWavenatoning = 400,
    EvWavenanoise = 401,
    EvWavedgesensi = 402,
    EvWavedgeampli = 403,
    EvWavlev3nois = 404,
    EvWavNPmet = 405,
    EvretinexMethod = 406,
    EvLneigh = 407,
    EvLgain = 408,
    EvLoffs = 409,
    EvLstr = 410,
    EvLscal = 411,
    EvLvart = 412,
    EvLCDCurve = 413,
    EvRetinextransmission = 414,
    EvRetinexEnabled = 415,
    EvRetinexmedianmap = 416,
    EvLlimd = 417,
    EvretinexColorSpace = 418,
    EvLCDHCurve = 419,
    Evretinexgamma = 420,
    EvLgam = 421,
    EvLslope = 422,
    EvLhighl = 423,

    EvRetinexlhcurve = 425,
    EvOIntent = 426,
    EvMonitorTransform = 427,
    EvLiter = 428,
    EvLgrad = 429,
    EvLgrads = 430,
    EvLhighlights = 431,
    EvLh_tonalwidth = 432,
    EvLshadows = 433,
    EvLs_tonalwidth = 434,
    EvLradius = 435,
    EvmapMethod = 436,
    EvRetinexmapcurve = 437,
    EvviewMethod = 438,
    EvcbdlMethod = 439,
    EvRetinexgaintransmission = 440,
    EvLskal = 441,
    EvOBPCompens = 442,
    EvWBtempBias = 443,
    EvRawImageNum = 444,



    EvPixelShiftEperIso = 448,


    EvPixelshiftShowMotion = 451,
    EvPixelshiftShowMotionMaskOnly = 452,



    EvPixelShiftNonGreenCross = 456,




    EvPixelShiftGreen = 461,

    EvPixelShiftBlur = 463,
    EvPixelShiftSigma = 464,


    EvPixelShiftHoleFill = 467,
    EvPixelShiftMedian = 468,

    EvPixelShiftMotionMethod = 470,
    EvPixelShiftSmooth = 471,
    EvPixelShiftLmmse = 472,
    EvPixelShiftEqualBright = 473,
    EvPixelShiftEqualBrightChannel = 474,
    EvCATtempout = 475,
    EvCATgreenout = 476,
    EvCATybout = 477,
    EvCATDegreeout = 478,
    EvCATAutoDegreeout = 479,
    EvCATtempsc = 480,
    EvCATgreensc = 481,
    EvCATybscen = 482,
    EvCATAutoyb = 483,
    EvLensCorrMode = 484,
    EvLensCorrLensfunCamera = 485,
    EvLensCorrLensfunLens = 486,
    EvTMFattalEnabled = 487,
    EvTMFattalThreshold = 488,
    EvTMFattalAmount = 489,
    EvWBEnabled = 490,
    EvRGBEnabled = 491,
    EvLEnabled = 492,
    EvPdShrEnabled = 493,
    EvPdShrMaskToggled = 494,

    NUMOFEVENTS

};


class ProcEvent {
public:
    ProcEvent(): code_(0) {}
    ProcEvent(ProcEventCode code): code_(code) {}
    explicit ProcEvent(int code): code_(code) {}
    operator int() const { return code_; }

private:
    int code_;
};


inline bool operator ==(ProcEvent a, ProcEvent b) { return int(a) == int(b); }
inline bool operator ==(ProcEvent a, ProcEventCode b) { return int(a) == int(b); }
inline bool operator ==(ProcEventCode a, ProcEvent b) { return int(a) == int(b); }
inline bool operator !=(ProcEvent a, ProcEvent b) { return int(a) != int(b); }
inline bool operator !=(ProcEvent a, ProcEventCode b) { return int(a) != int(b); }
inline bool operator !=(ProcEventCode a, ProcEvent b) { return int(a) != int(b); }

}
# 24 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.h" 2
# 81 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.h"
extern int refreshmap[];

namespace rtengine
{

class RefreshMapper {
public:
    static RefreshMapper *getInstance();
    ProcEvent newEvent();
    void mapEvent(ProcEvent event, int action);
    int getAction(ProcEvent event) const;

private:
    RefreshMapper();

    int next_event_;
    std::unordered_map<int, int> actions_;
};

}
# 20 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.cc" 2
# 29 "/root/oss-experiment/data/rawtherapee-5.8/rtengine/refreshmap.cc"
int refreshmap[rtengine::NUMOFEVENTS] = {
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<7)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<7)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    (1<<17),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    0,
    0,
    0,
    ((1<<3)|(1<<2)|(1<<1)|(1<<0))|(1<<4),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    (1<<12),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    (1<<14),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    (1<<17),
    (1<<17),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)) | (1<<11),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    (1<<17),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0))|(1<<4),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0))|(1<<4),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    0,
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    (1<<14),
    (1<<14),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    ((1<<13)|((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0))),
    (1<<14),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    0,
    0,
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    0,
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    0,
    0,
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    0,
    0,
    0,
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    0,
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    0,
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<11)|(1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<2)|(1<<1)|(1<<0)),
    ((1<<10)|(1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)),
    ((1<<9)|(1<<8)|(1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<0)|(1<<18))

};


namespace rtengine
{

RefreshMapper::RefreshMapper():
    next_event_(rtengine::NUMOFEVENTS)
{
    for (int event = 0; event < rtengine::NUMOFEVENTS; ++event) {
        actions_[event] = refreshmap[event];
    }
}


ProcEvent RefreshMapper::newEvent()
{
    return ProcEvent(++next_event_);
}


void RefreshMapper::mapEvent(ProcEvent event, int action)
{
    actions_[event] = action;
}


int RefreshMapper::getAction(ProcEvent event) const
{
    auto it = actions_.find(event);
    if (it == actions_.end()) {
        return 0;
    } else {
        return it->second;
    }
}


RefreshMapper *RefreshMapper::getInstance()
{
    static RefreshMapper instance;
    return &instance;
}

}
