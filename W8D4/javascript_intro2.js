function titleize(names, callback) {
    let res_arr = [];
    res_arr = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    callback(res_arr);
};

printCallback = names => {
    names.forEach(name => console.log(name));
};

titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks){
    
    this.name = name;
    this.height = height;
    this.tricks = tricks;

}

Elephant.prototype.trumpet = function(){
    console.log(`${this.name} the elephant goes 'phrRRRRRRR!!!!!!'`);
}

Elephant.prototype.grow = function () {
    this.height += 12;
}

Elephant.prototype.addTrick = function (trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function () {
    chooseTrick = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[chooseTrick]}!`);
}

Elephant.paradeHelper = function (ele1) {
    console.log(`${ele1.name} is trotting by!`);
}



let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(ele => Elephant.paradeHelper(ele));

// james.trumpet();
// james.grow();
// james.addTrick("slides on sleds");
// james.play()

function dinerBreakfast(){
    let order = "I'd like cheesy scrambled eggs please";
    console.log(order);

    return function(food){
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
    };

};

dinerBreakfast("pizza");
dinerBreakfast("potatos");
dinerBreakfast("ham");