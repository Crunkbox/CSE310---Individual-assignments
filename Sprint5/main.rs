fn Variables() {
    let x = 10; // immutable by default
    println!("Immutable x: {}", x);

    let mut y = 5; // mutable
    println!("Mutable y before: {}", y);

    y += 3;
    println!("Mutable y after: {}", y);
}

fn Loops() {
    // for loop
    for i in 0..5 {
        println!("for loop: {}", i);
    }

    // while loop
    let mut count = 0;
    while count < 3 {
        println!("while loop: {}", count);
        count += 1;
    }

    // loop (infinite loop with break)
    let mut num = 0;
    loop {
        if num == 2 {
            break;
        }
        println!("loop: {}", num);
        num += 1;
    }
}

// These next three functions are set up for ownership transfer and borrowing.
fn TakeOwnership(s: String) {
    println!("Owned string: {}", s);
}
fn BorrowString(s: &String) {
    println!("Borrowed string: {}", s);
}
fn ModifyString(s: &mut String) {
    s.push_str(" (modified)");
}

fn Ownership() {
    let s1 = String::from("Hello");

    take_ownership(s1);
    // println!("{}", s1); // ❌ ERROR: s1 moved

    let s2 = String::from("World");
    borrow_string(&s2); // borrow instead
    println!("Still usable: {}", s2);

    let mut s3 = String::from("Mutable");
    modify_string(&mut s3);
    println!("After modification: {}", s3);
}

fn Vector() {
    let mut numbers = vec![1, 2, 3];

    numbers.push(4);
    println!("Vector: {:?}", numbers);

    // iterate
    for n in &numbers {
        println!("Value: {}", n);
    }

    // access safely
    match numbers.get(2) {
        Some(value) => println!("Index 2: {}", value),
        None => println!("No value at index 2"),
    }
}

fn Match(value: i32) {
    match value {
        1 => println!("One"),
        2 | 3 => println!("Two or Three"),
        4..=10 => println!("Between 4 and 10"),
        _ => println!("Something else"),
    }
}

fn main() {
    Variables();
    Loops();
    Ownership();
    Vector();
    Match(5);
}