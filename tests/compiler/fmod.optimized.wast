(module
 (type $FFF (func (param f64 f64) (result f64)))
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $fff (func (param f32 f32) (result f32)))
 (type $v (func))
 (import "env" "abort" (func $abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 4) "\07\00\00\00f\00m\00o\00d\00.\00t\00s")
 (export "fmod" (func $fmod/fmod))
 (export "fmodf" (func $fmod/fmodf))
 (export "memory" (memory $0))
 (start $start)
 (func $fmod/fmod (; 1 ;) (type $FFF) (param $0 f64) (param $1 f64) (result f64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 f64)
  (block $folding-inner0
   (set_local $3
    (i32.wrap/i64
     (i64.and
      (i64.shr_u
       (tee_local $2
        (i64.reinterpret/f64
         (get_local $0)
        )
       )
       (i64.const 52)
      )
      (i64.const 2047)
     )
    )
   )
   (set_local $6
    (i32.wrap/i64
     (i64.and
      (i64.shr_u
       (tee_local $5
        (i64.reinterpret/f64
         (get_local $1)
        )
       )
       (i64.const 52)
      )
      (i64.const 2047)
     )
    )
   )
   (if
    (i32.and
     (if (result i32)
      (tee_local $7
       (i32.and
        (if (result i32)
         (tee_local $7
          (i64.eq
           (i64.shl
            (get_local $5)
            (i64.const 1)
           )
           (i64.const 0)
          )
         )
         (get_local $7)
         (f64.ne
          (tee_local $8
           (get_local $1)
          )
          (get_local $8)
         )
        )
        (i32.const 1)
       )
      )
      (get_local $7)
      (i32.eq
       (get_local $3)
       (i32.const 2047)
      )
     )
     (i32.const 1)
    )
    (return
     (f64.div
      (f64.mul
       (get_local $0)
       (get_local $1)
      )
      (f64.mul
       (get_local $0)
       (get_local $1)
      )
     )
    )
   )
   (if
    (i64.le_u
     (i64.shl
      (get_local $2)
      (i64.const 1)
     )
     (i64.shl
      (get_local $5)
      (i64.const 1)
     )
    )
    (block
     (br_if $folding-inner0
      (i64.eq
       (i64.shl
        (get_local $2)
        (i64.const 1)
       )
       (i64.shl
        (get_local $5)
        (i64.const 1)
       )
      )
     )
     (return
      (get_local $0)
     )
    )
   )
   (set_local $7
    (i32.wrap/i64
     (i64.shr_u
      (get_local $2)
      (i64.const 63)
     )
    )
   )
   (set_local $2
    (if (result i64)
     (get_local $3)
     (i64.or
      (i64.and
       (get_local $2)
       (i64.const 4503599627370495)
      )
      (i64.const 4503599627370496)
     )
     (block (result i64)
      (set_local $4
       (i64.shl
        (get_local $2)
        (i64.const 12)
       )
      )
      (loop $continue|0
       (if
        (i64.eqz
         (i64.shr_u
          (get_local $4)
          (i64.const 63)
         )
        )
        (block
         (set_local $3
          (i32.sub
           (get_local $3)
           (i32.const 1)
          )
         )
         (set_local $4
          (i64.shl
           (get_local $4)
           (i64.const 1)
          )
         )
         (br $continue|0)
        )
       )
      )
      (i64.shl
       (get_local $2)
       (i64.extend_u/i32
        (i32.sub
         (i32.const 1)
         (get_local $3)
        )
       )
      )
     )
    )
   )
   (set_local $5
    (if (result i64)
     (get_local $6)
     (i64.or
      (i64.and
       (get_local $5)
       (i64.const 4503599627370495)
      )
      (i64.const 4503599627370496)
     )
     (block (result i64)
      (set_local $4
       (i64.shl
        (get_local $5)
        (i64.const 12)
       )
      )
      (loop $continue|1
       (if
        (i64.eqz
         (i64.shr_u
          (get_local $4)
          (i64.const 63)
         )
        )
        (block
         (set_local $6
          (i32.sub
           (get_local $6)
           (i32.const 1)
          )
         )
         (set_local $4
          (i64.shl
           (get_local $4)
           (i64.const 1)
          )
         )
         (br $continue|1)
        )
       )
      )
      (i64.shl
       (get_local $5)
       (i64.extend_u/i32
        (i32.sub
         (i32.const 1)
         (get_local $6)
        )
       )
      )
     )
    )
   )
   (loop $continue|2
    (if
     (i32.gt_s
      (get_local $3)
      (get_local $6)
     )
     (block
      (if
       (i64.eqz
        (i64.shr_u
         (tee_local $4
          (i64.sub
           (get_local $2)
           (get_local $5)
          )
         )
         (i64.const 63)
        )
       )
       (block
        (br_if $folding-inner0
         (i64.eqz
          (get_local $4)
         )
        )
        (set_local $2
         (get_local $4)
        )
       )
      )
      (set_local $2
       (i64.shl
        (get_local $2)
        (i64.const 1)
       )
      )
      (set_local $3
       (i32.sub
        (get_local $3)
        (i32.const 1)
       )
      )
      (br $continue|2)
     )
    )
   )
   (if
    (i64.eqz
     (i64.shr_u
      (tee_local $4
       (i64.sub
        (get_local $2)
        (get_local $5)
       )
      )
      (i64.const 63)
     )
    )
    (block
     (br_if $folding-inner0
      (i64.eqz
       (get_local $4)
      )
     )
     (set_local $2
      (get_local $4)
     )
    )
   )
   (loop $continue|3
    (if
     (i64.eqz
      (i64.shr_u
       (get_local $2)
       (i64.const 52)
      )
     )
     (block
      (set_local $3
       (i32.sub
        (get_local $3)
        (i32.const 1)
       )
      )
      (set_local $2
       (i64.shl
        (get_local $2)
        (i64.const 1)
       )
      )
      (br $continue|3)
     )
    )
   )
   (return
    (f64.reinterpret/i64
     (i64.or
      (tee_local $2
       (select
        (i64.or
         (i64.sub
          (get_local $2)
          (i64.const 4503599627370496)
         )
         (i64.shl
          (i64.extend_u/i32
           (get_local $3)
          )
          (i64.const 52)
         )
        )
        (i64.shr_u
         (get_local $2)
         (i64.extend_u/i32
          (i32.sub
           (i32.const 1)
           (get_local $3)
          )
         )
        )
        (i32.gt_s
         (get_local $3)
         (i32.const 0)
        )
       )
      )
      (i64.shl
       (i64.extend_u/i32
        (get_local $7)
       )
       (i64.const 63)
      )
     )
    )
   )
  )
  (f64.mul
   (f64.const 0)
   (get_local $0)
  )
 )
 (func $fmod/fmodf (; 2 ;) (type $fff) (param $0 f32) (param $1 f32) (result f32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 i32)
  (block $folding-inner0
   (set_local $4
    (i32.and
     (i32.shr_u
      (tee_local $2
       (i32.reinterpret/f32
        (get_local $0)
       )
      )
      (i32.const 23)
     )
     (i32.const 255)
    )
   )
   (set_local $6
    (i32.and
     (i32.shr_u
      (tee_local $5
       (i32.reinterpret/f32
        (get_local $1)
       )
      )
      (i32.const 23)
     )
     (i32.const 255)
    )
   )
   (if
    (i32.and
     (if (result i32)
      (tee_local $3
       (i32.and
        (if (result i32)
         (tee_local $3
          (i32.eqz
           (i32.shl
            (get_local $5)
            (i32.const 1)
           )
          )
         )
         (get_local $3)
         (f32.ne
          (tee_local $7
           (get_local $1)
          )
          (get_local $7)
         )
        )
        (i32.const 1)
       )
      )
      (get_local $3)
      (i32.eq
       (get_local $4)
       (i32.const 255)
      )
     )
     (i32.const 1)
    )
    (return
     (f32.div
      (f32.mul
       (get_local $0)
       (get_local $1)
      )
      (f32.mul
       (get_local $0)
       (get_local $1)
      )
     )
    )
   )
   (if
    (i32.le_u
     (i32.shl
      (get_local $2)
      (i32.const 1)
     )
     (i32.shl
      (get_local $5)
      (i32.const 1)
     )
    )
    (block
     (br_if $folding-inner0
      (i32.eq
       (i32.shl
        (get_local $2)
        (i32.const 1)
       )
       (i32.shl
        (get_local $5)
        (i32.const 1)
       )
      )
     )
     (return
      (get_local $0)
     )
    )
   )
   (set_local $8
    (i32.and
     (get_local $2)
     (i32.const -2147483648)
    )
   )
   (set_local $2
    (if (result i32)
     (get_local $4)
     (i32.or
      (i32.and
       (get_local $2)
       (i32.const 8388607)
      )
      (i32.const 8388608)
     )
     (block (result i32)
      (set_local $3
       (i32.shl
        (get_local $2)
        (i32.const 9)
       )
      )
      (loop $continue|0
       (if
        (i32.eqz
         (i32.shr_u
          (get_local $3)
          (i32.const 31)
         )
        )
        (block
         (set_local $4
          (i32.sub
           (get_local $4)
           (i32.const 1)
          )
         )
         (set_local $3
          (i32.shl
           (get_local $3)
           (i32.const 1)
          )
         )
         (br $continue|0)
        )
       )
      )
      (i32.shl
       (get_local $2)
       (i32.sub
        (i32.const 1)
        (get_local $4)
       )
      )
     )
    )
   )
   (set_local $5
    (if (result i32)
     (get_local $6)
     (i32.or
      (i32.and
       (get_local $5)
       (i32.const 8388607)
      )
      (i32.const 8388608)
     )
     (block (result i32)
      (set_local $3
       (i32.shl
        (get_local $5)
        (i32.const 9)
       )
      )
      (loop $continue|1
       (if
        (i32.eqz
         (i32.shr_u
          (get_local $3)
          (i32.const 31)
         )
        )
        (block
         (set_local $6
          (i32.sub
           (get_local $6)
           (i32.const 1)
          )
         )
         (set_local $3
          (i32.shl
           (get_local $3)
           (i32.const 1)
          )
         )
         (br $continue|1)
        )
       )
      )
      (i32.shl
       (get_local $5)
       (i32.sub
        (i32.const 1)
        (get_local $6)
       )
      )
     )
    )
   )
   (loop $continue|2
    (if
     (i32.gt_s
      (get_local $4)
      (get_local $6)
     )
     (block
      (if
       (i32.eqz
        (i32.shr_u
         (tee_local $3
          (i32.sub
           (get_local $2)
           (get_local $5)
          )
         )
         (i32.const 31)
        )
       )
       (block
        (br_if $folding-inner0
         (i32.eqz
          (get_local $3)
         )
        )
        (set_local $2
         (get_local $3)
        )
       )
      )
      (set_local $2
       (i32.shl
        (get_local $2)
        (i32.const 1)
       )
      )
      (set_local $4
       (i32.sub
        (get_local $4)
        (i32.const 1)
       )
      )
      (br $continue|2)
     )
    )
   )
   (if
    (i32.eqz
     (i32.shr_u
      (tee_local $3
       (i32.sub
        (get_local $2)
        (get_local $5)
       )
      )
      (i32.const 31)
     )
    )
    (block
     (br_if $folding-inner0
      (i32.eqz
       (get_local $3)
      )
     )
     (set_local $2
      (get_local $3)
     )
    )
   )
   (loop $continue|3
    (if
     (i32.eqz
      (i32.shr_u
       (get_local $2)
       (i32.const 23)
      )
     )
     (block
      (set_local $4
       (i32.sub
        (get_local $4)
        (i32.const 1)
       )
      )
      (set_local $2
       (i32.shl
        (get_local $2)
        (i32.const 1)
       )
      )
      (br $continue|3)
     )
    )
   )
   (return
    (f32.reinterpret/i32
     (i32.or
      (tee_local $2
       (select
        (i32.or
         (i32.sub
          (get_local $2)
          (i32.const 8388608)
         )
         (i32.shl
          (get_local $4)
          (i32.const 23)
         )
        )
        (i32.shr_u
         (get_local $2)
         (i32.sub
          (i32.const 1)
          (get_local $4)
         )
        )
        (i32.gt_s
         (get_local $4)
         (i32.const 0)
        )
       )
      )
      (get_local $8)
     )
    )
   )
  )
  (f32.mul
   (f32.const 0)
   (get_local $0)
  )
 )
 (func $start (; 3 ;) (type $v)
  (local $0 f64)
  (local $1 f32)
  (if
   (f64.eq
    (tee_local $0
     (call $fmod/fmod
      (f64.const 1)
      (f64.const nan:0x8000000000000)
     )
    )
    (get_local $0)
   )
   (block
    (call $abort
     (i32.const 0)
     (i32.const 4)
     (i32.const 65)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (f64.ne
    (call $fmod/fmod
     (f64.const 1.5)
     (f64.const 1)
    )
    (f64.const 0.5)
   )
   (block
    (call $abort
     (i32.const 0)
     (i32.const 4)
     (i32.const 66)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f64.lt
     (f64.sub
      (call $fmod/fmod
       (f64.const 9.2)
       (f64.const 2)
      )
      (f64.const 1.2)
     )
     (f64.const 2.220446049250313e-16)
    )
   )
   (block
    (call $abort
     (i32.const 0)
     (i32.const 4)
     (i32.const 67)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f64.lt
     (f64.sub
      (call $fmod/fmod
       (f64.const 9.2)
       (f64.const 3.7)
      )
      (f64.const 1.8)
     )
     (f64.const 2.220446049250313e-16)
    )
   )
   (block
    (call $abort
     (i32.const 0)
     (i32.const 4)
     (i32.const 68)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (f32.eq
    (tee_local $1
     (call $fmod/fmodf
      (f32.const 1)
      (f32.const nan:0x400000)
     )
    )
    (get_local $1)
   )
   (block
    (call $abort
     (i32.const 0)
     (i32.const 4)
     (i32.const 134)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (f32.ne
    (call $fmod/fmodf
     (f32.const 1.5)
     (f32.const 1)
    )
    (f32.const 0.5)
   )
   (block
    (call $abort
     (i32.const 0)
     (i32.const 4)
     (i32.const 135)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.lt
     (f32.sub
      (call $fmod/fmodf
       (f32.const 9.199999809265137)
       (f32.const 2)
      )
      (f32.const 1.2000000476837158)
     )
     (f32.const 1.1920928955078125e-07)
    )
   )
   (block
    (call $abort
     (i32.const 0)
     (i32.const 4)
     (i32.const 136)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.lt
     (f32.sub
      (call $fmod/fmodf
       (f32.const 9.199999809265137)
       (f32.const 3.700000047683716)
      )
      (f32.const 1.7999999523162842)
     )
     (f32.const 1.1920928955078125e-07)
    )
   )
   (block
    (call $abort
     (i32.const 0)
     (i32.const 4)
     (i32.const 137)
     (i32.const 0)
    )
    (unreachable)
   )
  )
 )
)
