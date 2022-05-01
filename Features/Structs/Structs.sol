// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Structs {
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car[] public cars;
    mapping(address => Car) public carsData;

    function addCars() external {
        //First Way:
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        cars.push(toyota);

        //Second Way:
        Car memory lambo = Car({
            model: "Lamborghini",
            year: 1980,
            owner: msg.sender
        });
        cars.push(lambo);

        //Third Way：
        cars.push(Car("Ferrari", 2020, msg.sender));
    }

    function changeCar() external {
        Car storage _car = cars[0];
        _car.year = 1999;
        delete _car.owner;

        delete cars[1];
    }

    function getCars() public view returns (Car[] memory) {
        return cars;
    }

    function addCarsWithMapping() external {
        carsData[msg.sender] = Car({
            model: "Toyota",
            year: 1999,
            owner: msg.sender
        });
    }
}
