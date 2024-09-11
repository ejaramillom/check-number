# check-number
Class to make a recursion to find the sum of the digits of a number

## Prerequisites

Before you can run this application, ensure you have the following software installed on your machine:

- Ruby (version 3.1.6 or higher recommended)
- Bundler (to manage gem dependencies)
- Git (to clone the repository)

## Install ruby

To install Ruby, you can use a version manager such as RVM or rbenv.

```
\curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 3.1.6
rvm use 3.1.6 --default
```

## Install Bundler

Once Ruby is installed, you can install Bundler by running:

```
gem install bundler
```

## Install Git

You can check if Git is installed by running:

```
git --version
```

Otherwise, please follow the steps in https://git-scm.com/
Installation

To set up the project on your local machine, follow these steps:

1. Clone the repository. Open your terminal and run: 

```
git clone https://github.com/ejaramillom/check-number.git
cd check-number
```

2. Install dependencies:

Run Bundler to install the necessary gems:

```
bundle install
```

## Usage

You can invoke the module as follows. 

- Inside the route of the check-number folder, run the ruby terminal and invoke the module with a number you want to analyse.

```
# my_folders/check-number

bash =>
=> irb
=> require_relative 'check_number'
=> CheckNumber.new.sum_digits(321654)
```

- To run the tests you can invoke the spec as follows

```
# my_folders/check-number

bash =>
=> ruby check_number_spec.rb
```
