pragma solidity >=0.7.0 <0.9.0;  

/* Making a a voting contract 

1. We want the ability to accept proposals and store them 
    Proposal: Name, Namber
    
2. Voters & voting ability
    keep track of voting 
    check voters are authenticated to vote 
    
3. chairperson
    authenticate and deploy contract
*/

contract Ballot {
    
    struct Proposal {
        //in other to save gas we use bytes32: bytes are the basic units of measurement of information in computer processing
        // bytes will reduce gas 
        bytes32 name;  //name of each proposal 
        uint voteCount; //number of accumulated votes 
    }
    
    
    struct Voter {
        bool voted; 
        uint weight;  
        uint vote; 
    }
    
    Proposal[] public proposals; 
    mapping(address=> Voter) public voters;  //voters get the address as a key and Voter for value 
    address public chairperson; 
    
    constructor(bytes32[] memory proposalNames) {
       
       chairperson = msg.sender; 
       
       //add 1 to chairperson weight 
       voters[chairperson].weight = 1; 
        
        //will add the proposal names to the smart contract upon deployment
        for (uint i = 0; i < proposalNames.length; i++){
            proposals.push(Proposal({
                name: proposalNames[i], 
                voteCount:0
            })); 
        }
        
    }
    
    //function for authenticating voters 
    function giveRightToVote(address voter) public {
        
        require(msg.sender == chairperson,'Only the chairperson can give access to vote');
        
        //require that voter has not voted deployment
        
        require(!voters[voter].voted, 'The voter has already voted'); 
        
        require(voters[voter].weight == 0); 
        
        voters[voter].weight = 1; 
        
    }

   //function for voting 
   function vote(uint proposal) public {
       Voter storage sender = voters[msg.sender]; 
       
       require(sender.weight != 0, 'Already voted'); 
       require(!sender.voted, 'Aready voted'); 
       sender.voted = true; 
       sender.vote = proposal; 
       
       proposals[proposal].voteCount +=  sender.weight; 
   }
   
   
   
   
   //function that shows the winning proposal by integer 
   function winningProposal()public view returns (uint winningProposal_){
       uint winningVoteCount = 0; 
       for (uint i = 0; i < proposals.length; i++) {
           if(proposals[i].voteCount > winningVoteCount){
               winningVoteCount = proposals[i].voteCount; 
               winningProposal_ = i; 
               
           }
       }
   }
   
   
   function winningName() public view returns ( bytes32 winningName_){
       winningName_ = proposals[winningProposal()].name; 
       
   }
   
}


