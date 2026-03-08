-module(example).
-export([
    greet/1,
    factorial/1,
    classify_number/1,
    sum_list/1,
    double_list/1,
    even_numbers/1,
    sum_with_fold/1
]).

%% 1. Pattern Matching in function parameters
greet({person, Name}) ->
    io:format("Hello ~s!~n", [Name]);
greet({robot, ID}) ->
    io:format("Greetings unit ~p~n", [ID]);
greet(_) ->
    io:format("Unknown entity~n").

%% 2. Recursion
factorial(0) ->
    1;
factorial(N) ->
    N * factorial(N - 1).

%% 3. Guards
classify_number(N) when N > 0 ->
    positive;
classify_number(N) when N < 0 ->
    negative;
classify_number(0) ->
    zero.

%% 4. Lists (basic list recursion)
sum_list([]) ->
    0;
sum_list([Head | Tail]) ->
    Head + sum_list(Tail).

%% 5. Lambda functions with lists:map
double_list(List) ->
    lists:map(fun(X) -> X * 2 end, List).

%% Lambda with lists:filter
even_numbers(List) ->
    lists:filter(fun(X) -> X rem 2 == 0 end, List).

%% Lambda with lists:foldl
sum_with_fold(List) ->
    lists:foldl(fun(X, Acc) -> X + Acc end, 0, List).