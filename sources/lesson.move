#[allow(unused_variable)]
module suimoveworkshop::lesson;

public struct StructLesson has drop {
    count: u8,
}

//Avaliabilities
// key, drop, store, copy

public fun variables() { let str = StructLesson { count: 4 }; //Integers
    //Unsigned u8 => 0 - 2**8-1
    let a: u8 = 0; let b = 0; let c = 0u8;  //u16, u32, u64, u128, u256;
    let x: u16 =
        23; let y: u32 = 46; let z: u64 = 64; let w: u128 = 128; let h: u256 = 256;  //vector
    let v = vector::empty<u8>();  //Bool true - false
    let b = true;  // address
    let a = @0x01;  // tuples & unit
    let (t, u): (u8, u32) = (
        0,
        34,
    );  let (m, n) = use_it();  let r = add(255, 255);  let d = check(8, 7);  if (d) {
        loop_func(1, 20);
        while_func(20, 40);
    } }

fun use_it(): (u8, u32) {
    return (0, 56)
}

fun add(i: u8, j: u8): u8 {
    i + j
}

fun check(a: u8, b: u8): bool {
    a >= b
}

fun loop_func(mut i: u8, j: u8) {
    //loops => loop, while
    loop {
        if (i>j) break;
        i = i +1;
    }
}

fun while_func(mut i: u8, j: u8) {
    while (i < j) {
        i = i + 1;
    }
}
