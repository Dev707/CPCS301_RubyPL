# Ruby Programming language Project 
CPCS-301

## Implementation and Report


### Implementation method that Ruby use
Ruby is a Hybrid implementation System, which means 
Ruby’s code is compiled into a set of bytecode instructions that are 
interpreted by a virtual machine called YARV (Yet another ruby virtual-machine).


### Brief description of the suggested domains that can apply by Ruby
You can use Ruby just like you would use any other general-purpose scripting language. A few examples would be web applications, web servers, system utilities, database work, backups, parsing. So, you can use Ruby to do a lot of things. It’s not going to be good at all of them but at least it will allow you to get started, test some ideas and help you figure out if you need a more specialized language or not


### Identifiers and declaration of variables using EBNF for Ruby
Ruby identifiers consist of alphabets, decimal digits, and the underscore character, and begin with an alphabet(including underscore) and numbers. There are no restrictions on the lengths of Ruby identifiers

```
<identifier>  → (< letter > | “ _ “ ) { < letter > | < digit > | “ _ “| ^ }
```

Global variables should start with “$”, then you can use letters, digits and underscore

```
<Global variables> → < $ > { < letter > | < digit > |“ _ “| ^ }
```

Instance variables should start with “@”, then you can use letter or digit or underscore

```
<instance Variables> → <@> { “ _ “ | < digit > | < letter > | ^ }
```

class variables should start with “@@”, then you can use letter or digit  or underscore 

```
<class variables> → <@@> { “ _ “ | < digit > | < letter > | ^ }
```

local variables should start with (small letter or underscore), then you can use letter or digit or underscore

```
<local variables> →(< Small Letter > | “ _ “) { “ _ “ | < digit > | < letter > |^}
```

constant should start with Upper case letters, then you can use letter or digit or underscore

```
<constant> →  < Upper Letter > { “ _ “ | < digit > | < letter > | ^ }
```

2.3.7	Integer can start with (Sign), then you use digits   

```
<integer> →  [( - | +)] {<digit>}
```

2.3.8	floating point can start with a (sign), then use digits, you can put ‘.’ and digits after that

```
<floating point> → [( - | +)] {<digit>} [<\.> {<digit>} ]
```

2.3.9	Letters, Digits and Underscore

```
Letter → ( a | b | - - - | z | A | B | C | - - - - | Z )
Digit → (0 | 1 | 2 | - - - | 9 | )
Underscore →  ( _ )
Upper Letter→ (A | B | C | - - - - | Z )
Small Letter→ ( a | b | - - - | z )
```


## The judgments on the readability, writability, reliability and cost

### Readability
Ruby is readable PL because it is like any other PL similar to human language also Variable name’s in Ruby are very descriptive so that’s will make the language easier to read and understand.

### Writability
Ruby is easy to write for example in declaring a variable you don’t have to put a variable type such as (int, String, etc.) the compiler will know the type of your variable.

### Reliability
•	Ruby is a dynamically typed language, meaning type checks are performed at run time for the most part, decreases reliability.
•	Ruby is case-sensitive and will increase reliability.

### Cost
Ruby does not support Array Bound Checking that’s mean the execution will be fast since it will not check and so fast execution better cost.
Ruby one of the open source languages and free license.
